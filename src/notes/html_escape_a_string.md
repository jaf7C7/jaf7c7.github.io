# HTML-Escape A String

Run the following in the *browser console* (it won't work in `node`):

```javascript
function escapeHTML(str){
    return new Option(str).innerHTML;
}
```

E.g.
```javascript
> escapeHTML('test & <b>sample</b>')
"test &amp; &lt;b&gt;sample&lt;/b&gt;"
```

[Source](https://stackoverflow.com/questions/3043775/how-to-escape-html)
