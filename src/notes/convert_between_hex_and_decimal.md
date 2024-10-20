# How To Convert Between Hex And Decimal Numbers

You have two options:

1. Using `printf(3)` (from `coreutils`) or `printf` (`bash` builtin):
```bash
$ printf '%d\n' 0xff  # hex -> dec
255
$ printf '%x\n' 255   # dec -> hex
ff
```

2. Using `bc(1)`. **NOTE**: `bc` is very picky. `obase` must be specified
   before `ibase`, and all letters must be uppercase, or `bc` treats them as
   variable names.
```bash
$ printf 'obase=10; ibase=16; FF\n' | bc
255
$ printf 'obase=16; ibase=10; 255\n' | bc
FF
```

An example utility function might be:
```bash
bconv() {
    # Usage: bconv <ibase> <obase> <number>
    printf 'obase=%d; ibase=%d; %s\n' "$2" "$1" "${3@U}" | bc
}
```
