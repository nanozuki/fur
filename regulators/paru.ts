import { execute } from "../util/command.ts";
import { Regulator } from "./regulator.ts";

const storage = {
  latest: false,
  bin: "paru",
  init: async function (): Promise<void> {
    if (!this.latest) {
      await execute(this.bin, "-Syu");
      this.latest = true;
    }
  },
};

// TODO: install paru itself
export function paru(...pkgs: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      await storage.init();
      for (const pkg of pkgs) {
        await execute(storage.bin, "-S", "--needed", pkg);
      }
    },
  };
}
