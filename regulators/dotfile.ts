import { renderFile } from "https://deno.land/x/mustache@v0.3.0/mod.ts";
import {
  dirname,
  join,
  normalize,
  parse,
} from "https://deno.land/std@0.105.0/path/mod.ts";
import { ensureDir, walk } from "https://deno.land/std@0.105.0/fs/mod.ts";
import { Regulator } from "./regulator.ts";

export function dotFile(
  source: string,
  target: string,
  value?: Record<string, unknown>,
): Regulator {
  return {
    async exec(): Promise<void> {
      source = normalize(source);
      target = normalize(target);
      await execSource(source, target, value);
    },
  };
}

async function execSource(
  source: string,
  target: string,
  value?: Record<string, unknown>,
): Promise<void> {
  const fileInfo = await Deno.stat(source);
  if (fileInfo.isFile) {
    console.log(`render ${source} to ${target}`);
    await execFile(source, target, value);
  } else if (fileInfo.isDirectory) {
    console.log(`detect ${target} by ${source}`);
    for await (const entry of walk(source)) {
      if (entry.isFile) {
        const targetPath = entry.path.replace(source, target);
        console.log(`exec_source(${entry.path}, ${targetPath})`);
        await execSource(entry.path, targetPath, value);
      }
    }
  }
}

async function execFile(
  source: string,
  target: string,
  value?: Record<string, unknown>,
): Promise<void> {
  let filepath = target;
  const info = parse(filepath);
  console.log("filepath info", info);
  if (info.ext === ".mustache") {
    filepath = join(info.dir, info.name);
  }
  const content = await renderFile(source, value);
  const dir = dirname(target);
  await ensureDir(dir);
  console.log(`write to ${filepath}`);
  await Deno.writeTextFile(filepath, content);
}
