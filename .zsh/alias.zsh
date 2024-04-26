alias cd="z"
alias cls="clear"
alias v="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse -q '$*' | xargs nvim"
alias g="git branch --list | fzf-tmux -p | xargs git checkout" 
alias s="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux -p --reverse | xargs yarn"
alias ..="cd .."
alias double="~/Developer/bash/dir_selector.sh"
alias top="bpytop"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'
alias lt='ls --tree'

