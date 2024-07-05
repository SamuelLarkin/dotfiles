# Samuel Larkin's dotfiles

Migrating to `chezmoi`.


## Install

Add the following lines to your `~/.bashrc`:

```sh
# User specific aliases and functions
[[ -e ~/.alias ]] && . ~/.alias || true
[[ -e ~/.bashrc.common ]] && . ~/.bashrc.common || true
[[ -e ~/.bashrc.specific ]] && . ~/.bashrc.specific || true
[[ -d ~/.bash_completion.d ]] && for f in ~/.bash_completion.d/*; do source $f; done || true
```
