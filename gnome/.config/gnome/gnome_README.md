To back up gnome configs run the followign:
```
dconf dump /org/gnome/ > ~/dotfiles/gnome/.config/gnome/settings.conf
gnome-extensions list > ~/dotfiles/gnome/.config/gnome/extensions.list
```

Stow does't apply the gnome configs to your system, you need to run
the following:
```
stow -d ~/dotfiles gnome
dconf load /org/gnome/ < ~/.config/gnome/settings.conf
# cat ~/.config/gnome/extensions.list | xargs -L1 gnome-extensions install
```

Commands with \# are untested.
