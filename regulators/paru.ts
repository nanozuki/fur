import { execute } from "../util/command.ts";

const storage = {
  latest: false,
  bin: "yay",
  init: async function (): Promise<void> {
    if (!this.latest) {
      await execute(this.bin, "-Syu");
      this.latest = true;
    }
  },
};

export class Paru {
  private packages: Set<string>;

  static setup(config: { bin: string }) {
    storage.bin = config.bin;
  }

  public constructor(...pkgs: string[]) {
    this.packages = new Set();
    pkgs.forEach((pkg) => this.packages.add(pkg));
  }

  public async exec(): Promise<void> {
    await storage.init();
    for (const pkg of this.packages) {
      await execute(storage.bin, "-S", "--needed", pkg);
    }
  }
}
