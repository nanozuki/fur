import { Command } from "../util/command.ts";

const storage = {
  selfInstalled: false,
  latest: false,
  installed: new Set<string>(),
  init: async function (): Promise<void> {
    if (!this.selfInstalled) {
      await installFisher();
      this.selfInstalled = true;
    }
    if (!this.latest) {
      await new Command("fish", "-c", "fisher update").exec();
      this.latest = true;
    }
    if (this.installed.size === 0) {
      const list = await new Command("fish", "-c", "fisher list").output();
      list.split("\n").forEach((plugin) => this.installed.add(plugin));
    }
  },
};

async function installFisher(): Promise<void> {
  const installed = await new Command("fish", "-c", "type -q fisher").status();
  if (installed) {
    return;
  }
  await new Command(
    "fish",
    "-c",
    "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher",
  ).exec();
  return;
}

export class Fisher {
  private plugins: Set<string>;
  constructor(...plugins: string[]) {
    this.plugins = new Set();
    plugins.forEach((plugin) => this.plugins.add(plugin));
  }

  async exec(): Promise<void> {
    await storage.init();
    for (const plugin of this.plugins) {
      if (!storage.installed.has(plugin)) {
        await new Command("fish", "-c", `fisher install ${plugin}`).exec();
        storage.installed.add(plugin);
      }
    }
  }
}
