export interface Config {
  env: Record<string, string>;
  fur: FurConfig;
}

export interface FurConfig {
  cargo: CargoConfig;
  goInstall: GoInstall;
}

export interface CargoConfig {
  rustup?: boolean;
  channel?: string;
}

export interface GoInstall {
  env: Record<string, string>;
}
