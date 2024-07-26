# Samuel Larkin's dotfiles

Migrating to `chezmoi`.

## Install

Add the following lines to your `~/.bashrc` if they are not present:

```sh
# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi

unset rc
```
