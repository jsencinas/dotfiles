#!/bin/bash

DOTFILES=~/dotfiles

# Keybindings
dconf dump /org/gnome/desktop/wm/keybindings/ > keybindings.ini

# Extensions names list
gnome-extensions list > $DOTFILES/gnome/extensions.txt

# Extensions settings
dconf dump /org/gnome/shell/extensions/ > $DOTFILES/gnome/extensions-settings.ini


cd $DOTFILES
git add .
git commit -m "dotfiles update $(date '+%Y-%m-%d %H:%M')"
git push

echo "Updated GNOME settings"
