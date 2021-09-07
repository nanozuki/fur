import { Regulator } from "./regulators/regulator.ts";

export class Fur {
  regulators: Regulator[];
  constructor(...regulators: Regulator[]) {
    this.regulators = regulators;
  }
  async exec(): Promise<void> {
    for (const rg of this.regulators) {
      await rg.exec();
    }
  }
}
