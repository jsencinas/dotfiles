#!/bin/bash

DOTFILES=~/dotfiles

# Keybindings
dconf dump /org/gnome/desktop/wm/keybindings/ > keybindings.ini

# Extensions names list
gnome-extensions list > $DOTFILES/gnome/extensions.txt

# Extensions settings
dconf dump /org/gnome/shell/extensions/ > $DOTFILES/gnome/extensions-settings.ini

