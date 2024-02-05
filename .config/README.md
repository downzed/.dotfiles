# Dotfiles Repository

Welcome to my personal dotfiles repository, where I share my custom configurations for a streamlined and productive development environment on macOS. This setup is centered around `yabai` for tiling window management, `sketchybar` for a highly customizable status bar, and `skhd` for efficient keyboard-driven control.

## Features

- **Yabai**: A tiling window manager that automatically organizes windows into a non-overlapping layout, enhancing focus and multitasking.
- **Sketchybar**: A versatile status bar that displays system and application information with style, fully customizable to fit your needs.
- **Skhd**: A simple hotkey daemon that allows the binding of keyboard shortcuts to various actions, making window and application management a breeze.

## Getting Started

### Prerequisites

Before you begin, ensure your macOS system has the following tools installed:

- **Homebrew**: The package manager for macOS, used for installing the necessary software. If you haven't installed Homebrew yet, you can do so by running the following command in your terminal:

    ```sh
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

- **jq**: A lightweight and flexible command-line JSON processor, useful for parsing and managing JSON data in scripts and configurations. After installing Homebrew, install `jq` by running:

    ```sh
    brew install jq
    ```

### Installation

1. **Yabai**:

   Install `yabai` via Homebrew:

   ```sh
   brew install koekeishiya/formulae/yabai
   ```

   Start and enable `yabai`:

   ```sh
   brew services start yabai
   ```

   For more detailed instructions and configurations, visit the [Yabai GitHub repository](https://github.com/koekeishiya/yabai).

2. **Sketchybar**:

   Install `sketchybar` using Homebrew:

   ```sh
    brew tap FelixKratz/formulae
    brew install sketchybar
   ```

   Start and enable `sketchybar`:

   ```sh
   brew services start sketchybar
   ```

   Customize `sketchybar` by editing its configuration file. More details can be found on the [Sketchybar GitHub repository](https://github.com/FelixKratz/SketchyBar).

3. **Skhd**:

   Install `skhd`:

   ```sh
   brew install koekeishiya/formulae/skhd
   ```

   Start and enable `skhd`:

   ```sh
   brew services start skhd
   ```

   Configure your hotkeys by editing the `~/.skhdrc` file. For more information, check out the [Skhd GitHub repository](https://github.com/koekeishiya/skhd).

## Configuration

This section describes how to integrate `yabai`, `sketchybar`, and `skhd` with your dotfiles. Ensure to symlink or copy your configuration files into their respective locations.

### Yabai

Place your `yabai` configuration in `~/.yabairc`. An example configuration might look like this:

```sh
# Enable window gaps
yabai -m config window_gap 10

# Set top padding
yabai -m config top_padding 20

# More configurations...
```

### Sketchybar

`sketchybar` configurations go into `~/.config/sketchybar/plugins`. Here's a basic setup:

```sh
# Define a simple item
sketchybar --add item time right

# More plugin configurations...
```

### Skhd

Define your keyboard shortcuts in `~/.skhdrc`. Example:

```sh
# Reload yabai configuration
shift + alt - r : yabai -m config reload

# Navigate windows
alt - h : yabai -m window --focus west
# More shortcuts...
```

## Usage

Describe how to use the configured environment, including common commands and shortcuts that enhance productivity.

## Contribution

Feel free to fork this repository and customize the dotfiles to suit your needs. Contributions, suggestions, and improvements are welcome!

## License

This project is open-sourced under the MIT License. See the [LICENSE](LICENSE) file for more details.

