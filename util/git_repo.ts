import { dirname } from "https://deno.land/std@0.105.0/path/mod.ts";
import { ensureDir, exists } from "https://deno.land/std@0.105.0/fs/mod.ts";
import { Command, execute } from "../util/command.ts";

export interface SyncRepoResult {
  path: string;
  clone: boolean;
  update: boolean;
}

const gitUrlRe = /^(git@|https?:\/\/)(.*)(.git)$/;

function getGitRepoPath(prefix: string, url: string): string {
  const words = gitUrlRe.exec(url);
  if (words === null) {
    throw Error(`${url} is not a valid git remote url.`);
  }
  return `${prefix}/${words[2].replace(":", "/")}`;
}

export class GitRepo {
  static cachePath = "~/.cache/neovix/git";

  static setup(config: { cache: string }) {
    GitRepo.cachePath = config.cache;
  }

  constructor(
    public url: string,
    public opt?: { branch?: string },
  ) {}

  async sync(): Promise<SyncRepoResult> {
    const path = getGitRepoPath(GitRepo.cachePath, this.url);
    const result = { path, clone: false, update: false };
    if (!(await exists(path))) {
      result.clone = true;
      result.update = true;
      const dir = dirname(path);
      await ensureDir(dir);
      const cmd = [
        "git",
        "clone",
        "--depth=1",
        "--recurse-submodules",
        "--shallow-submodules",
      ];
      if (this.opt?.branch) {
        cmd.push("-b", this.opt?.branch);
      }
      cmd.push(this.url, path);
      await execute(...cmd);
    } else {
      const prevCommit = await new Command("git", "rev-parse", "@").cwd(path)
        .output();
      await new Command(
        "git",
        "pull",
        "--recurse-submodules",
        "--update-shallow",
      ).execute();
      const curCommit = await new Command("git", "rev-parse", "@").cwd(path)
        .output();
      result.update = curCommit !== prevCommit;
    }
    return result;
  }
}
