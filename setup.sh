#!/bin/bash

uspec="$HOME/.npmrc"
defuser="rjpower"

if [[ ! "$USER" = "$defuser" ]]; then 
    echo "WARNING: You're not $defuser... The following are username specific and will need to be updated:"
    for f in $uspec; do
        echo "    - $f"
    done
fi

function stowHome {
    local hpath="./home"
    for config_group in "$hpath"/*; do
        if [[ -d "$config_group" && ! -L "$config_group" ]]; then
            stow --dotfiles -d "$hpath" -t $HOME $(basename "$config_group")
        fi
    done
}

stowHome

# --- Config, Local groups
# --- This is the group that needs to go in $HOME/.config
# --- We have to do this because of https://github.com/aspiers/stow/issues/33
stow --dotfiles -t "$HOME/.config" config
stow --dotfiles -t "$HOME/.local" local

