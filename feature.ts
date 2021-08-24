import { Regulator } from "./regulators/regulator.ts";

class Feature {
  regulators: Regulator[] = [];
  constructor(
    public name: string,
  ) {}

  public async exec(): Promise<void> {
    for (const rg of this.regulators) {
      await rg.exec();
    }
  }
}

export function feature(name: string, ...Regulator: Regulator[]): Feature {
  return new Feature(name, ...Regulator);
}
