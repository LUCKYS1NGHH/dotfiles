# Arch Hyprland dotfiles

## Screenshots

![](screenshots/image_1.png)
![](screenshots/image_2.png)
![](screenshots/image_3.png)

## Install

> [!IMPORTANT]
> Before installing, please backup your `~/.config` directory.

```bash
git clone --depth=1 https://github.com/LUCKYS1NGHH/dotfiles.git
cd dotfiles
cp -r .config/* ~/.config/ 
```

## Tools & Dependencies
#### you can replace any of these tools with your preferred alternatives after cloning.

| Name      | Description                                | Dependencies |
|-----------|--------------------------------------------|--------------|
| cava      | Terminal Audio Visualizer                  | N/A          |
| clock-rs  | CLI clock                                  | N/A          |
| waybar    | Status bar                                 | `swaync`, `pacman-contrib`, `NetworkManager`, `network-manager-applet`, `brightnessctl`, `pavucontrol`, `python3`, `python-requests` |
| kitty     | Fast GPU-accelerated terminal              | `ttf-firacode-nerd` |
| fastfetch | System info                                | N/A          |
| hypr      | hyprland window-manager and it's utilities |  `hyprlock`, `hyprshot`, `swaync`, `waybar`, `hyprsunset`, `kitty`, `thunar`, `wl-clipboard`, `rofi` |
| swaync    | Notification center                        |`hyprlock`, `network-manager-applet`, `blueman`, `obs-studio`, `pavucontrol` |
| rofi      | Dynamic Menu                               | N/A          |
