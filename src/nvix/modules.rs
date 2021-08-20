pub struct Feature {
    pub name: String,
    pub pkg_deps: Vec<String>,
    pub plug_deps: Vec<String>,
    pub config: String,
    pub values: String,
}

pub trait PkgController {
    fn new() -> Self;
    fn is_latest(&self, pkg: &str) -> bool;
    fn sync(&self, pkg: &str);
}

pub struct PlugController {}

impl PlugController {
    pub fn is_latest(&self, pkg: &str) -> bool {
        return true;
    }
    pub fn sync(&self, pkg: &str){}
}

pub struct Neovix<P: PkgController> {
    pub pkg: P,
    pub plug: PlugController,
}

impl Neovix<P: PkgController> {
    pub fn sync(&self, features: Vec<Feature>) {
        for f in features.iter() {
            self.sync_feature(f)
        }
    }

    fn sync_feature(&self, feature: &Feature) {
        println!("sync system packages");
        for pkg in feature.system_deps {
            println!("sync {}", pkg);
            if self.pkg.is_latest(pkg) {
                println!("already latest, not change");
            } else {
                self.pkg.sync(pkg);
            }
        }
        println!("sync system packages");
        for plug in feature.plug_deps {
            println!("sync {}", plug);
            if self.plug.is_latest(plug) {
                println!("already latest, not change");
            }else{
                self.pkg.sync(plug);
            }
        }
        // install config...
    }
}
