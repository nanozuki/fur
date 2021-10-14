import { Regulator } from "../regulators/regulator.ts";
import { status, execute } from "../util/command.ts";

export function rustup(): Regulator {
  return {
    async exec(): Promise<void> {
      const installed = await status("fish", "-c", "type -q rustup");
      if (!installed) {
        await execute("fish", "-c", "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh")
      } else {
          execute("rustup", "-q", "update")
      }
    },
  };
}

export function cargoInstall(...pkgs: string[]): Regulator {
  return {
    async exec ():Promise<void> {
      for (const pkg of pkgs) {
        await execute("cargo", "install",  pkg);
      }
    }
  }
}
