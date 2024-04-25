alias cls="clear"
alias cd="z"
alias f="fd --type f --hidden --exclude .git | fzf-tmux -p --reverse -q '$*' | xargs nvim"

alias ls='lsd'
alias ll='ls -l'
alias la='ls -a'
alias lsa='ls -la'
alias lt='ls --tree'

