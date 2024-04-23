
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

alias cls="clear"
alias cd="z"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim"


export NVM_DIR="$HOME/.nvm"
export ZK_NOTEBOOK_DIR="$HOME/Documents/personal/notes"
export VOLTA_HOME="$HOME/.volta"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
# export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# export PATH="~/.nvm/versions/node/v20.9.0/bin/eslint_d:$PATH"
export PATH="$VOLTA_HOME/bin:$PATH"

eval "$(starship init zsh)"
eval "$(thefuck --alias)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# source /opt/homebrew/opt/spaceship/spaceship.zsh
