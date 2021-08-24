import { execute, output } from "../util/command.ts";

const storage = {
  installed: new Set<string>(),
  latest: false,
  init: async function (): Promise<void> {
    if (!this.latest) {
      await execute("brew", "update");
      await execute("brew", "upgrade");
      this.latest = true;
    }
    if (this.installed.size === 0) {
      const list = (await output("brew", "list")).split("\n");
      list.forEach((pkg) => {
        this.installed.add(pkg);
        const words = pkg.split("@");
        if (words.length > 1) {
          this.installed.add(words[0]);
        }
      });
    }
  },
};

export class Homebrew {
  private packages: Set<string>;

  public constructor(...pkgs: string[]) {
    this.packages = new Set();
    pkgs.forEach((pkg) => this.packages.add(pkg));
  }

  public async exec(): Promise<void> {
    await storage.init();
    for (const pkg of this.packages) {
      if (!storage.installed.has(pkg)) {
        await execute("brew", "install", pkg);
      }
    }
  }
}

export function brew(...pkgs: string[]): Homebrew {
  return new Homebrew(...pkgs);
}
