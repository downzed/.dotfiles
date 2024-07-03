alias cd="z"
alias cls="clear"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse -q '$*' | xargs nvim"
alias st="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux -p --reverse | xargs yarn"
alias g="git branch --list | fzf-tmux -p | xargs git checkout" 
alias sf="bat package.json | jq -r '.scripts | keys[]' | fzf --reverse --inline-info | xargs yarn"
alias ..="cd .."
alias top="bpytop"
alias sleepnow="pmset sleepnow"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'
alias lst='ls --tree'

