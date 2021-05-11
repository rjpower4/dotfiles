#!/bin/bash

# ---  Standard Config Groups
#standard="shell tmux"
#for config_group in $standard; do
#    stow --dotfiles -t "$HOME" "$config_group"
#done

function stowHome {
    local hpath="./home"
    for config_group in "$hpath"/*; do
        if [[ -d "$config_group" && ! -L "$config_group" ]]; then
            stow --dotfiles -d "$hpath" -t $HOME $(basename "$config_group")
        fi
    done
}

# --- Config, Local groups
# --- This is the group that needs to go in $HOME/.config
# --- We have to do this because of https://github.com/aspiers/stow/issues/33
stow --dotfiles -t "$HOME/.config" config
stow --dotfiles -t "$HOME/.local" local

stowHome
