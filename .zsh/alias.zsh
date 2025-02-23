alias cd="z"
alias cls="clear"
alias vi="fd --type f --hidden --exclude .git | fzf --height=50% --reverse --preview 'bat {}' | xargs nvim"
alias g="git branch --list | fzf --height=50% --reverse | xargs git checkout" 
alias yarn="cat package.json | jq -r '.scripts | keys[]' | fzf --height=65% --reverse --border | xargs yarn"
alias ..="cd .."
alias top="bpytop"
alias py="python3"
alias sleepnow="pmset sleepnow"
alias vim="nvim"

alias eza='eza --icons'
alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lsa='eza -la'
alias lst='eza --tree'

# docker
alias dp='docker ps --format "table {{.ID}}\t{{.Names}}\t\t{{.Status}}\t{{.Ports}}"' ## docker ps table
alias dpe='docker exec -it $(docker ps --format "{{.Names}}" | fzf) bash' ## docker exec fzf  
alias dr='docker-compose down; cls; docker-compose up -d' ## docker restart 

alias pn='pnpm'
alias gor='cls; go run .'
alias got='cls; go test -v' ## runs all tests and examples

