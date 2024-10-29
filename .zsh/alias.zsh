alias cd="z"
alias cls="clear"
alias vi="fd --type f --hidden --exclude .git | fzf-tmux --height=50% --reverse --preview 'bat {}' | xargs nvim"
alias g="git branch --list | fzf --height=50% --reverse | xargs git checkout" 
alias sc="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux --height=65% --reverse --border | xargs yarn"
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
alias dr='docker-compose down; cls; docker-compose up --watch' ## docker restart 

alias dr_v2='cls; docker-compose down; cls;docker-compose -f docker-compose-m1.yml --env-file=docker.env up --watch'
alias pn='pnpm'

