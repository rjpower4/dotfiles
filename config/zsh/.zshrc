autoload -Uz compinit promptinit
compinit
promptinit
prompt walters

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

source $HOME/.config/zsh/aliases


export CARGO_HOME="$HOME/.local/opt/cargo"
export RUSTUP_HOME="$HOME/.local/opt/rustup"
export GOPATH="$HOME/.local/depot/go"

export PATH="$HOME/.local/opt/juliaup/bin/:$PATH"
export PATH="$CARGO_HOME/bin:$PATH"
export PATH="$HOME/.local/opt/go/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export LESSHISTFILE="$HOME/.cache/less-history"

bindkey '^r' history-incremental-search-backward
bindkey -e
