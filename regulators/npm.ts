import { Regulator } from "../regulators/regulator.ts";
import { Command } from "../util/command.ts";

export function npm(...pkgs: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      for (const pkg of pkgs) {
        await new Command("node", "-g", "install", pkg).exec();
      }
    },
  };
}
