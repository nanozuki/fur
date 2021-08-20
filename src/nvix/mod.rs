mod modules;

use std::process::Command;

#[macro_export]
macro_rules! status {
    ($command:expr, $($x:expr),*) => {{
        let mut cmd = &mut Command::new($command);
        $(
            cmd = cmd.arg($x);
        )*
        cmd.status().expect("execute $command failed")
    }};
}

#[macro_export]
macro_rules! stdout {
    ($command:expr, $($x:expr),*) => {{
        let mut cmd = &mut Command::new($command);
        $(
            cmd = cmd.arg($x);
        )*
        let output = cmd.output().expect("execute $command failed");
        String::from_utf8_lossy(&output.stdout).into_owned()
    }};
}

pub fn brew_install(pkg: &str) {
    status!("echo", "brew install", pkg);
    let brew_list = stdout!("brew", "list");
    if brew_list.split('\n').any(|p| p == pkg) {
        println!("already installed: {}", pkg);
        return;
    }
    status!("brew", "install", pkg);
}

pub struct Feature {
    pub name: String,
    pub system_deps: Vec<String>,
}

impl Feature {
    pub fn execute(&self) {
        status!("echo", "sync feature", &self.name);
        for dep in self.system_deps.iter() {
            brew_install(dep);
        }
    }
}

pub trait PkgInstaller {
    fn init() -> Self;
    fn check_installed(&self, pkg: &str) -> bool;
    fn install(&self, pkg: &str);
}
