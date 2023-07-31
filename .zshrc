#
# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath+=($HOME/.zsh/pure)

autoload -U promptinit; promptinit
prompt pure

# plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/k/k.sh
# source ~/.zsh/zsh-completions/src
# source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# aliases

alias cls="clear"
alias ..="cd .."
alias ~="cd ~"
alias vim="nvim"
alias dots="cls; cd ~/.dotfiles/; nvim"
alias yarn_refresh="echo 'Removing node_modules...'; rm -rf node_modules; echo 'Running Yarn'; yarn; echo 'Yarn is Ready \n run yrun dev'|cowsay"
alias weather="curl 'wttr.in/Dvora?format=3'"
alias nala_update="sudo nala update; sudo nala upgrade -y; sudo nala autopurge; sudo nala autoremove; echo 'system updated...' | cowsay"
# alias ohmyzsh="vim ~/.oh-my-zsh"
alias py="python3"
alias ai="cd ~/projects/ai" 
alias rust="cd ~/projects/rust"
alias lsa="tree -LCa 1"

export NVM_DIR="$HOME/.nvm"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# [ -z "$TMUX" ] && command -v tmux &>/dev/null && tmux 

eval $(thefuck --alias fuck) 

# pnpm
#export PNPM_HOME="/home/downzed/.local/share/pnpm"
#case ":$PATH:" in
#*":$PNPM_HOME:"*) ;;
#*) export PATH="$PNPM_HOME:$PATH" ;;
#esac


