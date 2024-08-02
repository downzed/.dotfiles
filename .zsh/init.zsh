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

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi


# Yazi
if command -v yazi &> /dev/null; then
  function yy() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
      builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
  } 
else 
  echo "Yazi not found! You should install it"
  read answer

  if [[ $answer =~ ^[Yy]$ ]]; then
    ########
    # nerd-fonts: (icons, recommended)
    # ffmpegthumbnailer:  (for video thumbnails)
    # 7-Zip: (for archive extraction and preview)
    # jq: (for JSON preview)
    # poppler: (for PDF preview)
    # fd: (for file searching)
    # rg: (for file content searching)
    # fzf: (for quick file subtree navigation)
    # zoxide: (for historical directories navigation)
    # ImageMagick: (for SVG, Font, HEIC, and JPEG XL preview)
    # xclip / wl-clipboard / xsel: (for system clipboard support)

    brew install yazi ffmpegthumbnailer sevenzip jq poppler fd ripgrep fzf zoxide imagemagick font-symbols-only-nerd-font

    if command -v yazi &> /dev/null; then
      echo "yazi installed"
    else
      echo "Error: Failed to install and source Yazi!"
    fi
  fi
fi
