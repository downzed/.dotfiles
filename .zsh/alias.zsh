alias cd="z"
alias cls="clear"
alias vi="fd --type f --hidden --exclude .git | fzf-tmux --height=50% --reverse --preview 'bat {}' | xargs nvim" ## open file with nvim
alias gb="git branch --list | fzf --height=50% --reverse | xargs git checkout"  ## git branch checkout
alias sc="bat package.json | jq -r '.scripts | keys[]' | fzf-tmux --height=65% --reverse --border | xargs yarn" ## run script with yarn
alias ..="cd .."
alias top="bpytop"
alias py="python3"
alias sleepnow="pmset sleepnow"
alias vim="nvim"

# docker
alias dp='docker ps --format "table {{.ID}}\t{{.Names}}\t\t{{.Status}}\t{{.Ports}}"' ## docker ps table
alias dpe='docker exec -it $(docker ps --format "{{.Names}}" | fzf) bash' ## docker exec fzf  

alias eza='eza --icons'
alias ls='eza'
alias ll='eza -l'
alias la='eza -a'
alias lsa='eza -la'
alias lst='eza --tree'

# work / version2 - docer "restart"
alias dr_v2='docker-compose down; cls;docker-compose -f docker-compose-m1.yml --env-file=docker.env up --watch' ## docker restart (version2)
alias dr_ms='docker-compose down; cls;docker-compose -f docker-compose.yml --env-file=.env up --watch' ## docker restart (minisites

## tests
alias t_desktop='export TEST_VIEW=dekstop && npm run test-desktop -- --env=local --grep @test-me --steps'
alias t_mobile='export TEST_VIEW=mobile && npm run test-mobile -- --env=local --grep @test-me --steps'
