alias cd="z"
alias cls="clear"
alias v="fd --type f --hidden --exclude .git | fzf --height=50% --reverse --preview 'bat {}' | xargs nvim"
alias g="git branch --list | fzf --height=50% --reverse | xargs git checkout" 
alias sc="bat package.json | jq -r '.scripts | keys[]' | fzf --height=65% --reverse --border | xargs yarn"
alias ..="cd .."
alias top="bpytop"
alias py="python3"
alias sleepnow="pmset sleepnow"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'
alias lst='ls --tree'

# sync c-learning notes (with date), to github
alias sync_notes="cd ~/Developer/notes/c; git add .; git commit -m 'Sync: $(date)'; git push; echo 'Synced notes to github'; cd -"
