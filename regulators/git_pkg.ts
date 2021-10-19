import { Command } from "../util/command.ts";
import { GitRepo } from "../util/git_repo.ts";
import { Regulator } from "./regulator.ts";

// Git package for binary whitch build in git repo
export function gitPkg(
  remote: string,
  commands: Command[],
  opt?: { branch?: string },
): Regulator {
  return {
    async exec(): Promise<void> {
      const repo = new GitRepo(remote, opt);
      const result = await repo.sync();
      if (result.update) {
        for (const c of commands) {
          await c.exec();
        }
      }
      return;
    },
  };
}
