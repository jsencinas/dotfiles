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
    - [vs-codium](#vs-codium)
- [Terminal](#Terminal)
    - [ghostty](#ghostty)
    - [zsh](#zsh)
    - [Oh My Zsh](#Oh-My-Zsh)
    - [Tmux](#Tmux)PENDING
    - [Yay](#Yay)
- [Desktop utilities](#Desktop-utilities)
    - [Gnome](#Gnome)
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
**Config**<br>
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
1. Run the following command:
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

## vs-codium
**Installation**
1. Run the following command:
```
yay -S vscodium-bin
```

**Config**
In here, as configs, I am refering more about plugins/extensions
1. Tokyo night (Theme)
2. VSCode Neovim
3. Prettier - Code formatter
4. Error Lens


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
[PENDING]

## Yay
Yay is an AUR helper and Pacman wrapper for Arch Linux.<br>
**Installation**
```
cd
git clone <yay_repo>
cd yay
makepkg -si
```

# Desktop utilities
## Gnome
Gnome is a Desktop enviorment for Linux
**Installation**
    ```
    sudo pacman -S gnome
    ```
**Config**<br>
a. Extensions setup
1. Install the browser connector
    ```sudo pacman -S gnome-browser-connector```
2. Install the following browser extension
    ```https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/```
3. Go to the gnome extensions website
    ```https://extensions.gnome.org/```
4. Install your desired extension with one click (You will see your 
installed extensions in the gnome extensions app).

5. I personally have the following extensions:
    - Blur my shell
    - Clipboard indicator
    - Dash to dock

b. Keyboard shortcuts configs
1. Move window one workspace to the left -->    Shift+Alt+Left
2. Move window one workspace to the right ->    Shift+Alt+Right
3. Move window to last workspace ---------->    Shift+Alt+End <br>
4. Move window to workspace 1 ------------->    Shift+Alt+1 
5. Move window to workspace 2 ------------->    Shift+Alt+2
6. Move window to workspace 3 ------------->    Shift+Alt+3 
7. Move window to workspace 4 ------------->    Shift+Alt+4 <br>
8. Close window --------------------------->    Alt+c
9. Launch terminal ------------------------>    Alt+Q<br>
10. Switch applications ------------------->    Disabled <br>
11. Switch to workspace 1 ----------------->    Alt+1
12. Switch to workspace 2 ----------------->    Alt+2
13. Switch to workspace 3 ----------------->    Alt+3
14. Switch to workspace 4 ----------------->    Alt+4 <br>
15. Switch to workspace on the left ------->    Disabled
16. Switch to workspace on the right ------>    Disabled
17. Switch windows ------------------------>    Alt+Tab <br>
18. Switch to next input source ----------->    Alt+Space
19. Activate the window menu -------------->    Disabled <br>
20. Show the notification list ------------>    Disabled
21. Toggle clipboard menu ----------------->    Super+v

# Fonts
## Apple fonts
**Installation**
```
yay -S apple-fonts
```
**Config**
Inside the fonts options in the Gnome Tweaks application, select the 
Interface Text and Document Text to SF Compact Display (Thats my 
personal preference).


## Times New Roman
**Installation**<br>
(This enables the Times New Roman option in google docs)
```
sudo pacman -S ttf-liberation ttf-dejavu
```

