use circ::ir;
use rand::distributions::Distribution;
use rug::Integer;
use std::sync::Arc;

fn main() {
    let mut rng = rand::thread_rng();
    for _ in 0..100 {
        let d = ir::term::dist::FixedSizeDist {
            bv_width: 4,
            sort: ir::term::Sort::Bool,
            pf_mod: Arc::new(Integer::from(7)),
            size: 6,
        };
        let t = d.sample(&mut rng);
        println!("Term: {}", t)
    }
}