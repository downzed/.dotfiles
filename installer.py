import subprocess
import os


subprocess.run(['curl', '-o-', 'https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh', '|', 'bash'])


# Install the Nala package
subprocess.run(['sudo', 'apt', 'install', 'nala', '-y'])


# Install the required packages using Nala
subprocess.run(['sudo', 'nala', 'install', 'sway', 'neovim', 'waybar', 'wofi', 'curl', 'git', 'wget', 'zsh', '-y'])

# Install oh-my-zsh
os.system('sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"')
