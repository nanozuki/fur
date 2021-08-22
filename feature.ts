import { Controller } from "./controllers/controller.ts";

class Feature {
  controllers: Controller[];
  constructor(
    public name: string,
    ...controllers: Controller[]
  ) {
    this.controllers = controllers;
  }

  public async exec(): Promise<void> {
    for (let c of this.controllers) {
      await c.exec();
    }
  }
}

export function feature(name: string, ...controllers: Controller[]): Feature {
  return new Feature(name, ...controllers);
}
