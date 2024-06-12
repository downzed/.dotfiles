alias cd="z"
alias cls="clear"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse -q '$*' | xargs nvim"
alias g="git branch --list | fzf-tmux -p | xargs git checkout" 
alias st="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux -p --reverse | xargs yarn"
alias sf="cat package.json | jq -r '.scripts | keys[]' | fzf --reverse --inline-info | xargs yarn"
alias ..="cd .."
alias top="bpytop"
alias sleepnow="pmset sleepnow"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'
alias lt='ls --tree'

