#!/usr/bin/env zsh

# Make sure to use double quotes
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh

zplug "lib/completion", from:oh-my-zsh, defer:2
zplug "lib/directories", from:oh-my-zsh, defer:2
zplug "lib/history", from:oh-my-zsh, defer:2
zplug "lib/key-bindings", from:oh-my-zsh, defer:2
zplug "lib/theme-and-appearance", from:oh-my-zsh, defer:2

zplug "zsh-users/zsh-completions", defer:2
zplug "nvm-sh/nvm", use:"nvm.sh"

# Can manage local plugins
zplug "$HOME/.zsh", from:local, use:"*.zsh", as:plugin

# Load theme file
# zplug 'dracula/zsh', as:theme
zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
# zplug load --verbose
zplug load
