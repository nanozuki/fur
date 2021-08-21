import { output, execute } from '../util/command.ts';

export class Homebrew {
  private installed: Set<string>;
  private packages: Set<string>;

  private constructor() {
    this.installed = new Set();
    this.packages = new Set();
  }

  static async new(): Promise<Homebrew> {
    const list = (await output('brew', 'list')).split('\n');
    const brew = new Homebrew();
    list.forEach(pkg => {
      brew.installed.add(pkg);
      const words = pkg.split('@');
      if (words.length > 1) {
        brew.installed.add(words[0]);
      }
    })
    return brew;
  }

  pkg(...pkgs: string[]) {
    pkgs.forEach(pkg => this.packages.add(pkg));
  }

  async sync(): Promise<void> {
    await execute('brew', 'update');
    await execute('brew', 'upgrade');
    this.packages.forEach(async (pkg: string) => {
      if (!this.installed.has(pkg)) {
        await execute('brew', 'install', pkg);
      }
    })
  }
}