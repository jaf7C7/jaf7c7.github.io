# Calculator

[Try it out](https://jaf7c7.github.io/calculator)

## Tech stack:
* HTML5
* CSS3
* Vanilla ES6 JavaScript

## Behaviour:
* The display is initially blank
* When a calculation is entered, it is echoed on the display
* Pressing `=` or entering a new calculation pushes the previous line up into
  the history and displays the new result/calculation
* Repeated `=` presses repeats the calculation (this only affects the result if
  calculations are being chained)
* Supports result chaining: Operations are performed on the previous result if
  no initial operand is given
* The user can use the keyboard or mouse to fully control the calculator

## Design
```
 ┌─────────────────────────────────┐
 │                                 │
 │                          4^4    │ <-- history
 │                          256    │ <-- main display
 │                                 │
 ├─────────────────┬───────┬───────┤
 │                 │       │       │
 │       AC        │  Del  │   /   │
 │                 │       │       │
 ├────────┬────────┼───────┼───────┤
 │        │        │       │       │
 │   1    │   2    │   3   │   *   │
 │        │        │       │       │
 ├────────┼────────┼───────┼───────┤
 │        │        │       │       │
 │   4    │   5    │   6   │   +   │
 │        │        │       │       │
 ├────────┼────────┼───────┼───────┤
 │        │        │       │       │
 │   7    │   8    │   9   │   -   │
 │        │        │       │       │
 ├────────┼────────┼───────┴───────┤
 │        │        │               │
 │   .    │   0    │       =       │
 │        │        │               │
 └────────┴────────┴───────────────┘
```

## Known Bugs

Very large numbers (`>10e+15`) cause and `Invalid expression` error.  Very
small numbers (`<10e-10`) are treated as `0`.
