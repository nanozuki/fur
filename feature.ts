import { Regulator } from "./regulators/regulator.ts";

// Feature for neovim feature
export class Feature {
  regulators: Regulator[] = [];
  plugins: (string | Plugin)[] = [];
  nvimConfigs: NeovimConfig[] = [];
  config = "";
  constructor(
    public name: string,
  ) {}

  public async exec(): Promise<void> {
    for (const rg of this.regulators) {
      await rg.exec();
    }
  }

  useRegulators(...regulators: Regulator[]): Feature {
    this.regulators = this.regulators.concat(...regulators);
    return this;
  }

  usePlugins(...plugins: (string | Plugin)[]): Feature {
    this.plugins = this.plugins.concat(...plugins);
    return this;
  }

  useConfigFile(
    source: string,
    value: Record<string, unknown> | undefined,
  ): Feature {
    this.nvimConfigs.push({
      source: source,
      value: value,
    });
    return this;
  }

  useConfig(config: string): Feature {
    this.config = config;
    return this;
  }
}

interface NeovimConfig {
  source: string;
  value: Record<string, unknown> | undefined;
}

interface Plugin {
  name: string;
}

export function feature(name: string): Feature {
  return new Feature(name);
}
