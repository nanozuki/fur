import { Homebrew } from "./controllers/homebrew.ts";

interface Controller {
  exec(): Promise<void>;
}

async function neovix(...controllers: Controller[]): Promise<void> {
  for (c in controllers) {
    await c.exec();
  }
}

async function main() {
  await neovix(
    new Homebrew("fish"),
    new Homebrew("neovim"),
  );
}

await main();
