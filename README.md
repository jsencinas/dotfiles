# Dot files and configs
IMAGE

# Table of contents
- [Overview](#Overview)
- [Quick setup](#Quick-setup)
- [Network config](#Network-config)
- [General software](#General-software) 
    - [Firefox](#firefox)
    - [Brave](#brave)
    - [stow](#stow)
    - [git](#git)
    - [nvim](#nvim)
- [Terminal](#Terminal)
    - [ghostty](#ghostty)
    - [zsh](#zsh)
    - [Oh My Zsh](#Oh-My-Zsh)
    - [Tmux](#Tmux)PENDING
- [Desktop utilities](#Desktop-utilities)
    - [Hypr](#Hypr)
    - [Waybar](#Waybar)*
    - [Sddm](#Sddm)
    - [Theming](#Theming)PENDING
    - [Network applet](#Network-applet)PENDING
    - [Bluetooth applet](#Bluetooth-applet)PENDING
    - [Brightness control](#Brightness-control)PENDING
- [Yay](#Yay)
- [Fonts](#Fonts)PENDING

# Overview
A compilation of all my gigachad config files for the software I use in my linux enviorment.
In addition, a series of .sh files are located in the repo. When runned, this .sh files install
all the dependencies necessary to work perfectly. For more info, take a look at the 
[quick setup](#Quick-setup) section.
Either way, clone this repository to your home directory. This repo will be needed to get the
configuration files, so if you don't want the dot files, theres no need to clone it.

# Quick setup
There are multiple sh files to automate some installation processes.
- To get a full desktop installation run the following file: 
- Modular sh files are located in the sh_files directory

# Network config
To initially connect to the wireless network, I recomend using the 
[iwctl](https://wiki.archlinux.org/title/Iwd) command.
1. Run the following command to start the interactive prompt
    ```
    iwctl
    ```
2. Get the wireless device name
    ```
    device list
    ```
3. If the device is turned of, do the following:
    ```
    device name set-property Powered on
    ```
    ```
    adapter adapter set-property Powered on
    ```
4. Scan for networks
    ```
    station <device_name> scan
    ```
5. Print the founded networks
    ```
    station <device_name> get-networks
    ```
6. Connect to the desired network
    ```
    station <device_name> connect <SSID>

    ```
7. You will be asked to input your the network password


Another good option is using the 
[network manager](https://wiki.archlinux.org/title/NetworkManager) utility.
1. Run the following command to display the available networks
    ```
    nmcli device wifi list
    ```
2. Connect to the target network
    ```
    nmcli device wifi connect <SSID_or_BSSID> password <password>
    ```

You can test your connection with the following command:
    ```
    ping google.com
    ```

# General software
## firefox
**Installation**
1. Run the following command to install the software:
```
sudo pacman -S firefox
```
**Create profiles**
1. Copy the ~/dotfiles/non-stow-files/firefox_users directory to ~/.local/share/applications
    ```
    cp -r ~/dotfiles/non-stow-files/application_configs/firefox ~/.local/share/applications
    ```
2. Run the following command:
    ```
    firefox --profilemanager
    ```
3. *(This is my personal preference)* Make sure the following profiles are created:
- Personal (Personal must be marked as default)
- Work

## brave
**Installation:**
Run the following command:
```
curl -fsS https://dl.brave.com/install.sh | sh
```
**Troubleshooting**
By simply installing brave, the application will look pixeled.
To solve it, follow the next steps:
1. Open the following file with sudo:
    ```
    /usr/share/applications/brave-browser.desktop
    ```
2. Replace the current "Exec=brave %U" with the following:
    ```
    Exec=brave --enable-features=UseOzonePlatform --ozone-platform=wayland %U
    ```

## stow
**Installation**
```
sudo pacman -S stow
```

## git
**Installation**
1. Run the following command:
```
sudo pacman -S git
```
**Configure**<br>
Git needs some information like an identifies so that git can register **who**
made certain change.
1. Set username
    ```
    git config --get user.<name>
    ```
2. Set email
    ```
    git config --get user.<email>
    ```
3. Github determines the principal branch name as "main", you can force git to use that convention 
instead of "master" with the following command:
    ```
    git config --global init.defaultBranch main
    ```
4. Make git rebase pulls automatically
    ```
    git config --global pull.rebase true
    ```
**Set up ssh key**
1. Generate the key with the following command:
    ```
    ssh-keygen -t ed25519 -C "<your_email@example.com>"
    ```
2. Run this command and copy the output:
    ```
    cat ~/.ssh/id_ed25519.pub
    ```
3. Now on github, go to "settings/SSH and GPG keys", click on "New SSH key" and paste your copied key.

## nvim
**Installation**
1. Run the following command to isntall the software:
    ```
    sudo pacman -S nvim
    ```
2. Stow the config files with this command:
    ```
    stow ~/dotfiles/nvim
    ```
**Dependencies**
1. wl-clipboard: To copy things to the system clipboard
    ```
    sudo pacman -S wl-clipboard
    ```
2. unzip: To install the clangd lsp
    ```
    sudo pacman -S unzip
    ```
3. nodejs: To install python the lsp
    ```
    sudo pacman -S nodejs
    ```
4. npm: To install the python lsp
    ```
    sudo pacman -S npm
    ```

# Terminal
## ghostty
**Installation**
```
sudo pacman -S ghostty
```
The config of hyprland located on this repository sets ghostty as
the default terminal over kitty.

## zsh
Zsh is an advanced Unix command interpreter (shell)<br>
**Installation**
```
sudo pacman -S zsh
```
**Set up as default shell**<br>
Run the following command:
```
chsh -s $(which zsh)
```

## Oh My Zsh
Plugin manager for zsh<br>
**Installation**
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Tmux
PENDING

# Desktop utilities
## hypr -> hyprland
Hyprland is a dynamic tiling Wayland compositor for Linux.<br>
**Installation**
```
sudo pacman -S hyprland
```
**Dependencies**<br>
(temporal) kitty needs to be installed as its the default terminal in hyprland.
```
sudo pacman -S kitty
```

**Remove built-in wallpapers**
```
sudo rm -rf /usr/share/hypr/wall*
```

## hypr -> hyprlock
Hyprlock, from the hypr ecosystem, is a lockscreen utility for hyprland.<br>
**Installation**
```
sudo pacman -S hyprlock
```

## hypr -> hypridle
Hypridle, from the hypr ecosystem, is Hyprland’s idle management daemon.<br>
**Installation**
```
sudo pacman -S hyprpaper
```

## hypr -> hyprpaper
Hyprpaper, from the hypr ecosystem, is a wallpaper utility for Hyprland.<br>
**Installation**
```
sudo pacman -S hyprpaper
```

## waybar
Waybar is a highly customizable Wayland bar for Sway and Wlroots based compositors.<br>
**Installation**
```
sudo pacman -S waybar
```

## Sddm
Github lik: https://github.com/Keyitdev/sddm-astronaut-theme
1. Run the following command:
    ```
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/keyitdev/sddm-astronaut-theme/master/setup.sh)"
    ```
2. To intall my custom gigachad theme (with little to no change), copy the following .conf file
    ```
    ~/dotfiles/non-stow-files/sddm_gigachad_theme/Themes/black_hole_gigachad.conf
    ```
    to folowing directory:
    ```
    /usr/share/sddm/themes/sddm-astronaut-theme/Themes
    ```
    You can do so automatically by runnig the following command:
    ```
    sudo cp ~/dotfiles/non-stow-files/sddm_gigachad_theme/Themes/black_hole_gigachad.conf /usr/share/sddm/themes/sddm-astronaut-theme/Themes/
    ```

3. To apply the config replace the following .desktop file
    ```
    ~/dotfiles/non-stow-files/sddm_gigachad_theme/metadata.desktop
    ```
    in the following directory:
    ```
    /usr/share/sddm/themes/sddm-astronaut-theme
    ```
    You can do so automatically by running the following command:
    ```
    sudo cp ~/dotfiles/non-stow-files/sddm_gigachad_theme/metadata.desktop /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
    ```
4. Finally, to add the balck hole theme, run the following command:
    ```
    sudo cp ~/dotfiles/backgrounds/black_hole_gigachad.png /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds
    ```
This will actually copy the black hole image to the /usr/share/sddm/themes/sddm-astronaut-theme/Backgrounds folder

## Theming
*nwg-look
    ```
    sudo pacman -S nwg-look
    ```

## Network applet
*nm-applet
*network-manager-demu
    ```
    sudo pacman -S nm-applet
    ```

## Bluetooth applet
*bluez bluez-utils blue-man

# Yay
Yay is an AUR helper and Pacman wrapper for Arch Linux.<br>
**Installation**
```
cd
git clone <yay_repo>
cd yay
makepkg -si
```

# Fonts
**Installation**<br>
(This enables the Times New Roman option in google docs)
```
sudo pacman -S ttf-liberation ttf-dejavu
```
