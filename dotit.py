#!/usr/bin/env python3

import os

# Define the dotfiles directory
dotfiles_dir = os.path.expanduser("~/.dotfiles")

# Define a dictionary of dotfiles to symlink
dotfiles = {
  ".zshrc": f"{dotfiles_dir}/.zshrc",
  ".gitconfig": f"{dotfiles_dir}/.gitconfig",
}

# Define a dictionary of directories to symlink
directories = {
  ".config/nvim": f"{dotfiles_dir}/.config/nvim",
  ".config/alacritty": f"{dotfiles_dir}/.config/alacritty",
  # ".config/eww": f"{dotfiles_dir}/.config/eww",
  # ".config/hypr": f"{dotfiles_dir}/.config/hypr",
  # ".config/mako": f"{dotfiles_dir}/.config/mako",
  # ".config/swaylock": f"{dotfiles_dir}/.config/swaylock",
  # ".config/spotify-player": f"{dotfiles_dir}/.config/spotify-player",
}

# Function to create a backup of existing file/directory
def backup_existing(path):
  if os.path.exists(path):
    print(f"Backing up existing {path} to {path}.bak")
    os.rename(path, f"{path}.bak")

# Loop through the dotfiles dictionary and create symbolic links
for dotfile, path in dotfiles.items():
  backup_existing(os.path.expanduser(f"~/{dotfile}"))
  print(f"Creating symlink for {dotfile}")
  os.symlink(path, os.path.expanduser(f"~/{dotfile}"))

# Loop through the directories dictionary and create symbolic links
for directory, path in directories.items():
  backup_existing(os.path.expanduser(f"~/{directory}"))
  print(f"Creating symlink for {directory}")
  os.symlink(path, os.path.expanduser(f"~/{directory}"))

