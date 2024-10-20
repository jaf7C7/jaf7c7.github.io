# How To Get Unicode Codepoint Of A Character

From character to codepoint:
```
$ python -c 'print(format(ord("›"), "08x"))'
0000203a
```

From codepoint to character (note "0x" prefix to indicate a zero-padded hexadecimal number):
```
$ python -c 'print(chr(0x203a))'
```

Example utility functions:
```bash
tochar() {
    python -c "print(chr(0x${1}))"
}

fromchar() {
    python -c "print(format(ord(\"${1}\"), '08x'))"
}
```


[Source](https://note.nkmk.me/en/python-chr-ord-unicode-code-point/)
