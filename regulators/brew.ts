import { execute, output } from "../util/command.ts";
import { Regulator } from "../regulators/regulator.ts";
import { Command } from "../util/command.ts";

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
      list.forEach((pkg) => this.add(pkg));
    }
  },
  add(pkg: string) {
    this.installed.add(pkg);
    const words = pkg.split("@");
    if (words.length > 1) {
      this.installed.add(words[0]);
    }
  },
};

export function brew(...pkgs: string[]): Regulator {
  return {
    async exec(): Promise<void> {
      await storage.init();
      for (const pkg of pkgs) {
        if (!storage.installed.has(pkg)) {
          await execute("brew", "install", pkg);
          storage.add(pkg);
        }
      }
    },
  };
}

export function brewNode(version: number): Regulator {
  const pkg = `node@${version}`;
  return {
    async exec(): Promise<void> {
      await storage.init();
      if (!storage.installed.has(pkg)) {
        await execute("brew", "install", pkg);
        storage.add(pkg);
        await new Command("brew", "link", "--force", "node@14").exec();
      }
    },
  };
}
