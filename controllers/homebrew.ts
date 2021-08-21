export class Homebrew {
  installed: string[];

  constructor(installed: string[]) {
    this.installed = installed;
  }

  static async new(): Promise<Homebrew> {
    const installed = (await output('brew', 'list')).split('\n');
    return new Homebrew(installed);
  }
}

async function output(...command: string[]): Promise<string> {
  const process =  Deno.run({cmd: command, stdout: 'piped', stderr: 'piped'})
  const status = await process.status();
  const stdout = await process.output();
  const stderr = await process.stderrOutput();
  if (!status.success) {
    throw Error(new TextDecoder().decode(stderr));
  }
  return (new TextDecoder().decode(stdout));
}

async function execute(...command: string[]): Promise<void> {
  const process =  Deno.run({cmd: command, stderr: 'piped'})
  const status = await process.status();
  const stderr = await process.stderrOutput();
  if (!status.success) {
    throw Error(new TextDecoder().decode(stderr));
  }
  return;
}

const brew = await Homebrew.new();
console.log(brew.installed);
execute("nvim");