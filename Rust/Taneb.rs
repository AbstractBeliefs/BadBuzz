use std::fmt::*;

struct FizzBuzz {
  depth : usize
}

impl Display for FizzBuzz {
  fn fmt(&self, f : &mut Formatter) -> Result {
    match self.depth % 15 {
      0 => write!(f, "fizzbuzz"),
      5 | 10 => write!(f, "buzz"),
      3 | 6 | 9 | 12 => write!(f, "fizz"),
      _ => write!(f, "{}", self.depth)
    }
  }
}

impl Drop for FizzBuzz {
  fn drop(&mut self) {
    println!("{}", self);
    if self.depth == 100 {
      return;
    }
    FizzBuzz{depth: self.depth+1};
  }
}

fn main() {
  FizzBuzz{depth: 1};
}