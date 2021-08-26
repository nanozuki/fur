import { Command } from "../util/command.ts";
import { Regulator } from "../regulators/regulator.ts";

// TODO: install in user files or support sudo
export function pip(...pkgs: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      for (const pkg of pkgs) {
        await new Command("python3", "-m", "pip", "install", "--upgrade", pkg)
          .exec();
      }
    },
  };
}
