#!/bin/sh

# ---  Standard Config Groups
standard="shell tmux"
for config_group in $standard; do
    stow --dotfiles -t $HOME $config_group
done

# --- Config group
# --- This is the group that needs to go in $HOME/.config
# --- We have to do this because of https://github.com/aspiers/stow/issues/33
stow --dotfiles -t $HOME/.config config
