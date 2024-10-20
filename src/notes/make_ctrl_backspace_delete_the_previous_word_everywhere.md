# How To Make Ctrl-Backspace Delete The Previous Word Everywhere

## Terminal

```bash
# Find out what char Ctrl-Backspace emits (usually '^H')
$ stty werase ''    # Disable 'werase'
$ ^H^H^H            # Press Ctrl-Backspace a few times
$ stty werase '^H'  # So we change 'werase' to '^H'
```

## Vim

```vimscript
" In Vim Ctrl-Backspace should always be equivalent to Ctrl-H. So we remap
" Ctrl-H (i.e. Ctrl-Backspace) to Ctrl-W anywhere we're inserting text.
:noremap! <C-H> <C-W>
```

## VSCode Powershell Terminal

In VSCode terminal Ctrl-Backspace sends `^W` for `bash` compatibility. The following will make it work in powershell.

### If you have admin access:

Run the following in an administrator powershell terminal:
```powershell
PS > Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Powershell will now execute startup commands from your profile, located at `%USERPROFILE%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`

Add the following to your profile:
```powershell
if ($Env:TERM_PROGRAM -eq "vscode") {
  "Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord"
}
```

### If you don't have admin access:

Add the following to your VSCode `settings.json`:
```json
{
  "terminal.integrated.profiles.windows": {
    "Powershell (VSCode)":  {  // <-- This can be whatever you like.
      "path": "powershell.exe",
      "args": [
        "-NoExit",
        "-Command",
        "Set-PSReadLineKeyHandler -Chord 'Ctrl+w' -Function BackwardKillWord"
      ]
    }
  }
}
```
