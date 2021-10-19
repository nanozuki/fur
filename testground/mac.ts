import { Fur } from "../fur.ts";
import { feature } from "../regulators/feature.ts";
import { brew, brewNode } from "../regulators/brew.ts";
import { npm } from "../regulators/npm.ts";
import { fisher } from "../regulators/fisher.ts";
import { dotFile } from "../regulators/dotfile.ts";
import { pip } from "../regulators/pip.ts";
import { gitPkg } from "../regulators/git_pkg.ts";
import { goInstall } from "../regulators/go_install.ts";
import { cargoInstall, rustup } from "../regulators/rust.ts";
import { Command } from "../util/command.ts";

const basic = feature("basic", brew("make", "tree", "direnv"));

const kitty = feature(
  "kitty",
  brew("kitty"),
  dotFile("./crowsenv/kitty", "./output/kitty"),
);
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
const goPkgs = [
  // go.nvim
  "github.com/davidrjenni/reftools/cmd/fillstruct@latest",
  "golang.org/x/tools/cmd/goimports@latest",
  "github.com/fatih/gomodifytags@latest",
  "github.com/segmentio/golines@latest",
  "gotests github.com/cweill/gotests/...@latest",
  // wire
  "github.com/google/wire/cmd/wire@latest",
  // swagger
  "github.com/go-swagger/go-swagger/cmd/swagger@latest",
  // grpc
  "google.golang.org/protobuf/cmd/protoc-gen-go@latest",
  "google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest",
  "github.com/golang/protobuf/{proto,protoc-gen-go}@latest",
  // lint lsp
  "github.com/nametake/golangci-lint-langserver@latest",
];
const go = feature(
  "go",
  new Command("fish", "-c", "set -Ux GOPATH $HOME/.go"),
  new Command("fish", "-c", "fish_add_path $GOPATH/bin"),
  brew("go", "gopls", "golangci-lint"),
  goInstall(...goPkgs),
);
const rust = feature(
  "rust",
  new Command("fish", "-c", "set -Ux CARGO_HOME $HOME/.cargo"),
  new Command("fish", "-c", "fish_add_path $CARGO_HOME/bin"),
  rustup(),
  brew("rust-analyzer"),
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
  cargoInstall("stylua"),
);

// basic fish kitty git tmux go rust zig nvim
const fur = new Fur(basic, kitty, fish, git, tmux, go, rust, lua, nvim);
await fur.exec();
