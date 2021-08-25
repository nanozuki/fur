import { Brew } from "../regulators/brew.ts";
import { DotFile } from "../regulators/dotfile.ts";
import { Feature } from "../feature.ts";
import { Set } from "../set.ts";
import { Nvix } from "../nvix.ts";

async function main() {
  const rust = new Feature("rust")
    .useRegulators(
      new Brew("rustup", "rust-analyzer"),
      // rustup("nightly"),
    )
    .useConfigFile("./templates/neovim/rust.lua", {})
    .useConfig(
      "vim.cmd autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)",
    );
  const tmux = new Set(
    new Brew("tmux"),
    new DotFile("./templates/tmux", "~/.config/tmux", {}),
  );
  const neovix = new Nvix(tmux, rust);
  await neovix.exec();
}

await main();
