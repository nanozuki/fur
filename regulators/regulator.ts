export interface Regulator {
  exec(): Promise<void>;
}
