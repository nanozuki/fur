//import { brew } from "../regulators/homebrew.ts";
import { dotfile } from "../regulators/dotfile.ts";
import { Regulator } from "../regulators/regulator.ts";

async function neovix(...regulators: Regulator[]): Promise<void> {
  for (const c of regulators) {
    await c.exec();
  }
}

async function main() {
  await neovix(
    //brew("fish"),
    //brew("neovim"),
    dotfile("./templates", "./output", { "a": 1 }),
  );
}

await main();
