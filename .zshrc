plugins=(git yarn npm brew cargo)

alias cls="clear"
alias cd="z"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"

export NVM_DIR="$HOME/.nvm"
export VOLTA_HOME="$HOME/.volta"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.cargo/env" 

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(thefuck --alias)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
