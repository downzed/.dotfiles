alias cd="z"
alias cls="clear"
alias vi="fd --type f --hidden --exclude .git | fzf-tmux --height=50% --reverse --preview 'bat {}' | xargs nvim"
alias g="git branch --list | fzf --height=50% --reverse | xargs git checkout" 
alias sc="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux --height=65% --reverse --border | xargs yarn"
alias ..="cd .."
alias top="bpytop"
alias py="python3"
alias sleepnow="pmset sleepnow"
alias vim="nvim"

alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lsa='eza -la'
alias lst='eza --tree'
