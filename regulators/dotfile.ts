import { renderFile } from "https://deno.land/x/mustache@v0.3.0/mod.ts";
import {
  dirname,
  join,
  normalize,
  parse,
} from "https://deno.land/std@0.105.0/path/mod.ts";
import { ensureDir, walk } from "https://deno.land/std@0.105.0/fs/mod.ts";

export class DotFile {
  constructor(
    public source: string,
    public target: string,
    public value?: Record<string, unknown>,
  ) {}

  public async exec(): Promise<void> {
    this.source = normalize(this.source);
    this.target = normalize(this.target);
    await this.exec_source(this.source, this.target);
  }

  private async exec_source(source: string, target: string): Promise<void> {
    const fileInfo = await Deno.stat(source);
    if (fileInfo.isFile) {
      console.log(`render ${source} to ${target}`);
      await this.exec_file(source, target);
    } else if (fileInfo.isDirectory) {
      console.log(`detect ${target} by ${source}`);
      for await (const entry of walk(source)) {
        if (entry.isFile) {
          const targetPath = entry.path.replace(source, target);
          console.log(`exec_source(${entry.path}, ${targetPath})`);
          await this.exec_source(entry.path, targetPath);
        }
      }
    }
  }

  private async exec_file(source: string, target: string): Promise<void> {
    let filepath = target;
    const info = parse(filepath);
    console.log("filepath info", info);
    if (info.ext === ".mustache") {
      filepath = join(info.dir, info.name);
    }

    const content = await renderFile(source, this.value);
    const dir = dirname(target);
    await ensureDir(dir);
    console.log(`write to ${filepath}`);
    await Deno.writeTextFile(filepath, content);
  }
}
