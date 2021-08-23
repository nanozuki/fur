import { renderFile } from "https://deno.land/x/mustache@v0.3.0/mod.ts";
import { dirname } from "https://deno.land/std@0.105.0/path/mod.ts";
import { ensureDir } from "https://deno.land/std@0.105.0/fs/mod.ts";

export class DotFile {
  constructor(
    public template: string,
    public target: string,
    public value: Record<string, unknown> | undefined,
  ) {}

  public async exec(): Promise<void> {
    const content = await renderFile(this.template, this.value);
    console.log(this.target, content);
    const dir = dirname(this.target);
    console.log("dirname", dir);
    await ensureDir(dir);
    console.log("target", this.target);
    await Deno.writeTextFile(this.target, content);
  }
}

export function dotfile(
  template: string,
  target: string,
  value: Record<string, unknown> | undefined,
): DotFile {
  return new DotFile(template, target, value);
}
