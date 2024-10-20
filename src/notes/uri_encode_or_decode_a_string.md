# URI Encode Or Decode A String

Javascript has built-in functions for this.

> **NOTE**: `encodeURI` and `decodeURI` are also built-in functions, and behave differently. You can read more about it on [StackOverflow] and [MDN].

```javascript
» // These functions URI encode/decode anything which has a special meaning in
» // a URI context. Useful for encoding query strings.
» encodeURIComponent('https://')
← 'https%3A%2F%2F'
» decodeURIComponent('https%3A%2F%2F')
← 'https://'
```

[StackOverflow]: https://stackoverflow.com/a/4540785 \
[MDN]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI
