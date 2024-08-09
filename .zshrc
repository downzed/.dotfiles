autoload -U colors && colors

. "$HOME/.cargo/env" 

# Add Homebrew and Volta to the PATH
export PATH="/usr/bin:$PATH"
export PYTHON="/opt/homebrew/bin/python3"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="/opt/homebrew/opt/jpeg/bin:$PATH"
# For compilers to find jpeg you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/jpeg/lib"
export CPPFLAGS="-I/opt/homebrew/opt/jpeg/include"
export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
# For pkg-config to find jpeg you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/jpeg/lib/pkgconfig"

export ZSH=$HOME/.zsh

export EDITOR="nvim"

# Set up fzf key bindings
source <(fzf --zsh)
# History settings
export HISTFILE=~/.zsh/.zsh_history
export HISTSIZE=10000  # Number of commands zsh will load into memory
export SAVEHIST=10000  # Number of commands history will save to file

setopt appendhistory  # Append history to file
setopt HIST_IGNORE_ALL_DUPS  # History won't save duplicates
setopt HIST_FIND_NO_DUPS  # History won't show duplicates on search

# Source configuration files
[[ -f $ZSH/alias.zsh ]] && source $ZSH/alias.zsh
[[ -f $ZSH/plugins.zsh ]] && source $ZSH/plugins.zsh
[[ -f $ZSH/completion.zsh ]] && source $ZSH/completion.zsh

# Initialize fun
[[ -f $ZSH/init.zsh ]] && source $ZSH/init.zsh



