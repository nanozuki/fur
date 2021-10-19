import { Regulator } from "./regulator.ts";
import { dotFile } from "./dotfile.ts";

export function nvimConfigDir(dir: string): Regulator {
  return {
    async exec(): Promise<void> {
      const fileInfo = await Deno.stat(dir);
      if (!fileInfo.isDirectory) {
        throw Error("nvimConfigDir must specified a directory, `{dir}` is not");
      }
      await dotFile(dir, ".config/nvim/lua").exec();
    },
  };
}

const storage = {
  usedMod: new Set<string>(), // Set will keep the insert order
  plugs: new Map<string, NvimPlugOpt>(),
}

export function nvimUseMod(mod: string): Regulator {
  storage.usedMod.add(mod)
  return {
    async exec(): Promise<void> {},
  }
}

interface NvimPlugOpt {
  branch?: string
}

export function nvimPlug(plug: string, opt?: NvimPlugOpt): Regulator {
  storage.plugs.set(plug, opt || {})
  return {
    async exec(): Promise<void> {},
  }
}
