import { Regulator } from "../regulators/regulator.ts";
import { Command } from "../util/command.ts";

export function goInstall(...pkgs: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      for (const pkg of pkgs) {
        await new Command("go", "install", pkg).exec();
      }
    },
  };
}
