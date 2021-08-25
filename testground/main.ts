import { Feature } from "../feature.ts";
import { Set } from "../set.ts";
import { Nvix } from "../nvix.ts";
import { Brew } from "../regulators/brew.ts";
import { DotFile } from "../regulators/dotfile.ts";
import { Command } from "../util/command.ts";

async function macos() {
  const basic = new Set(
    new Brew("make", "tree", "direnv"), // TODO: cask
    new Command(
      "fish",
      "-c",
      "set PATH ~/.local/bin /opt/homebrew/bin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /Library/Apple/usr/bin",
    ), // TODO: move to fish set.
  );
  const fish = new Set(
    new Brew("fish"),
  );
  const git = new Set();
  const tmux = new Set();
  const nvim = new Set();
  const go = new Feature("go");
  const rust = new Feature("rust");
  const zig = new Feature("zig");

  /*
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
  */
  const neovix = new Nvix(basic, fish, git, tmux, nvim, go, rust, zig);
  await neovix.exec();
}

await macos();
