#  The example of Ruby call rust-lib and benchmark


## compile command
```bash
 rustc lib.rs --crate-type=dylib
```
or

```bash
 rustc lib.rs --crate-type=dylib -C opt-level=3
```

## for Ruby

```bash
ruby src/porints.rb
```
