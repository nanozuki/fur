import { Command } from "../util/command.ts";
import { GitRepo } from "../util/git_repo.ts";

// Git package for binary whitch build in git repo
export class GitPkg {
  constructor(
    public remote: string,
    public commands: Command[],
    public opt?: { branch?: string },
  ) {}

  async exec(): Promise<void> {
    const repo = new GitRepo(this.remote, this.opt);
    const result = await repo.sync();
    if (result.update) {
      for (const c of this.commands) {
        await c.execute();
      }
    }
    return;
  }
}
