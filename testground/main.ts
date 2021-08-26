import { Nvix } from "../nvix.ts";
import { feature } from "../regulators/feature.ts";
import { brew, brewNode } from "../regulators/brew.ts";
import { npm } from "../regulators/npm.ts";
import { fisher } from "../regulators/fisher.ts";
import { dotFile } from "../regulators/dotfile.ts";
import { pip } from "../regulators/pip.ts";
import { gitPkg } from "../regulators/git_pkg.ts";
import { Command } from "../util/command.ts";

const basic = feature("basic", brew("make", "tree", "direnv"));

const fish = feature(
  "fish",
  brew("fish"),
  dotFile("./crowsenv/macos/fish", "./output/fish"),
  fisher("oh-my-fish/theme-cbjohnson", "jethrokuan/fzf", "jethrokuan/z"),
);
const git = feature(
  "git",
  brew("git"),
  dotFile("./crowsenv/macos/git/config", "./output/git/config"),
);
const tmux = feature(
  "tmux",
  brew("tmux"),
  dotFile("./crowsenv/macos/tmux", "./output/tmux", { theme: "edge" }),
);
const nvim = feature(
  "neovim installing",
  brew("nvim", "python", "node@14", "ripgrep", "fzf"),
  brewNode(14),
  pip("pynvim"),
  npm("neovim"),
  dotFile("./crowsenv/macos/nvim", "./output/nvim"),
);
const lua = feature(
  "lua",
  brew("ninja"),
  gitPkg(
    "https://github.com/sumneko/lua-language-server.git",
    [
      new Command("compile/install.sh").cwd("/3rd/luamake"),
      new Command("./3rd/luamake/luamake", "rebuild"),
    ],
  ),
);

const neovix = new Nvix(basic, fish, git, tmux, nvim, lua);
await neovix.exec();
