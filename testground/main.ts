import { Feature } from "../feature.ts";
import { Set } from "../set.ts";
import { Nvix } from "../nvix.ts";
import { Brew } from "../regulators/brew.ts";
import { Fisher } from "../regulators/fisher.ts";
import { DotFile } from "../regulators/dotfile.ts";

const basic = new Set(
  new Brew("make", "tree", "direnv"),
);
const fish = new Set(
  new Brew("fish"),
  new DotFile("./crowsenv/macos/fish", "./output/fish"),
  new Fisher("oh-my-fish/theme-cbjohnson", "jethrokuan/fzf", "jethrokuan/z"),
);
const git = new Set(
  new Brew("git"),
  new DotFile("./crowsenv/macos/git/config", "./output/git/config"),
);
const tmux = new Set(
  new Brew("tmux"),
  new DotFile("./crowsenv/macos/tmux", "./output/tmux", { theme: "edge" }),
);
const nvim = new Set(
  new Brew("nvim", "python"),
  // new Pip("pynvim")
  new Feature("go")
    .useRegulators(new Brew("go", "gopls"))
    .usePlugins("ray-x/go.nvim"),
  new Feature("rust"),
  new Feature("zig"),
);

const neovix = new Nvix(basic, fish, git, tmux, nvim);
await neovix.exec();
