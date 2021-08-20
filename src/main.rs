mod nvix;

use nvix::Feature;

fn main() {
    let feature = Feature {
        name: String::from("neovim"),
        system_deps: vec![String::from("neovim"), String::from("python")],
    };
    feature.execute();
}
