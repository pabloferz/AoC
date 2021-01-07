Day 03: [Toboggan Trajectory]
---

Here we have a horizontally periodic array of trees and need to count how many of them are
along a given slope. For arrays indexed from `0` we could use `mod` to handle this. In
Julia indices start at `1`, but we also have `mod1(x, y)`, which returns the modulus in
the range `(0, y]` as opposed to `[0, y)`:

[Toboggan Trajectory]: https://adventofcode.com/2020/day/3
