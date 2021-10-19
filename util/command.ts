export class Command {
  private opt: Deno.RunOptions;
  constructor(...cmd: string[]) {
    this.opt = { cmd };
  }
  cwd(path: string): Command {
    this.opt.cwd = path;
    return this;
  }
  env(key: string, value: string): Command {
    if (!this.opt.env) {
      this.opt.env = {};
    }
    this.opt.env[key] = value;
    return this;
  }

  async status(): Promise<boolean> {
    const process = Deno.run(this.opt);
    const status = await process.status();
    return status.success;
  }
  async exec(): Promise<void> {
    this.opt.stderr = "piped";
    const process = Deno.run(this.opt);
    const status = await process.status();
    const stderr = await process.stderrOutput();
    if (!status.success) {
      throw Error(new TextDecoder().decode(stderr));
    }
    return;
  }
  async output(): Promise<string> {
    this.opt.stdout = this.opt.stderr = "piped";
    const process = Deno.run(this.opt);
    const status = await process.status();
    const stdout = await process.output();
    const stderr = await process.stderrOutput();
    if (!status.success) {
      throw Error(new TextDecoder().decode(stderr));
    }
    return (new TextDecoder().decode(stdout));
  }
}

async function output(...command: string[]): Promise<string> {
  return (await new Command(...command).output());
}

async function execute(...command: string[]): Promise<void> {
  return (await new Command(...command).exec());
}

async function status(...command: string[]) {
  return (await new Command(...command).status());
}

export { execute, output, status };
