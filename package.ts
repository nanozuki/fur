export interface Package {
  manager: PackageManager;
  name: string;
  deps: Package[];
}

export interface PackageManager {
  ready(): Promise<boolean>;
  install(pkg: Package): Promise<void>;
}
