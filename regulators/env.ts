import { Regulator } from "./regulator.ts";
import { execute, status } from "../util/command.ts";

export function env(envs: Record<string, string>): Regulator {
  return {
    async exec(): Promise<void> {
      for await (const key of Object.keys(envs)) {
        execute("fish", "-c", `set -Ux ${key} ${envs[key]}`);
      }
    },
  };
}

export function path(...paths: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      const p = paths.join(" ");
      // if no path be set, fish_add_path will return error
      // use status to ignore error
      await status("fish", "-c", `fish_add_path ${p}`);
    },
  };
}
