# How To Create An Executable For A Node Module

> ⚠️  **NOTE**: This is a terrible hack.

For example, for [emmet](https://github.com/emmetio/emmet):

1. Install the package *for the current user*:
```bash
$ echo 'prefix=/home/jfox/.local' >~/.npmrc
$ npm install -g emmet
```
2. Create the executable file `bin.js` inside the root of the package directory:
```bash
$ cat >~/.local/lib/node_packages/emmet/dist/bin.js && chmod +x $_
#!/usr/bin/node

import expand from 'emmet';

const argv = process.argv.slice(2);

argv.forEach(arg => console.log(expand(arg)));

```
3. Create a symlink to this file in `~/.local/bin`:
```bash
$ ln -s ~/.local/lib/node_packages/emmet/dist/bin.js ~/.local/bin/emmet
```
4. Make sure `~/.local/bin/` is in your path:
```bash
$ cat >>~/.bashrc
if [[ -d "$HOME/.local/bin" && "$PATH" != "$HOME/.local/bin":* ]]
then
	PATH="$HOME/.local/bin:$PATH"
fi
```
5. Reload your shell and you're good to go:
```bash
$ exec bash
$ emmet 'p>a'
<p><a href=""></a></p>
```
