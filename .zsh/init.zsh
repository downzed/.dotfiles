### them evals, or install packages first

# brew
if command -v brew &> /dev/null; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "Homebrew not found! Would you like to download and install it?\n(y/n)"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then

    sh <(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)

    if command -v fzf &> /dev/null; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    else
      echo "Error: Failed to install and source Homebrew!"
    fi
  fi
fi

# fzf
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
else
  echo "fzf not found! Would you like to download and install it?\n(y/n)"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then

    brew install fzf

    if command -v fzf &> /dev/null; then
      eval "$(fzf --zsh)"
    else
      echo "Error: Failed to install and source fzf!"
    fi
  fi
fi


# thefuck
if command -v fuck &> /dev/null; then
  eval "$(thefuck --alias)"
else
  echo "thefuck not found! Would you like to download and install it?\n(y/n)"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then

    brew install thefuck

    if command -v fuck &> /dev/null; then
      eval "$(thefuck --alias)"
    else
      echo "Error: Failed to install and source thefuck!"
    fi
  fi
fi

# Zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
else
  echo "Zoxide not found! Would you like to download and install it?\n(y/n)"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then
    sh <(curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh)

    if command -v zoxide &> /dev/null; then
      eval "$(zoxide init zsh)"
    else
      echo "Error: Failed to install and source Zoxide!"
    fi
  fi
fi


# Starship
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  echo "Starship not found! Would you like to download and install it?"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then
    sh <(curl -sS https://starship.rs/install.sh)

    # Check for Starship installation again after installation
    if command -v starship &> /dev/null; then
      eval "$(starship init zsh)"
    else
      echo "Error: Failed to install and source Starship!"
    fi
  fi
fi

