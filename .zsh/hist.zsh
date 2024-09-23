# History settings
export HISTFILE=~/.zsh/.zsh_history
export HISTSIZE=999  # Number of commands zsh will load into memory
export SAVEHIST=1000  # Number of commands history will save to file
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

setopt appendhistory  # Append history to file
setopt HIST_IGNORE_ALL_DUPS  # History won't save duplicates
setopt HIST_FIND_NO_DUPS  # History won't show duplicates on search

