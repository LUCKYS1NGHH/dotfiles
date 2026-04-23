# Arch Hyprland dotfiles

## Screenshots

![clock-rs, fastfetch and cava floating windows](screenshots/image_1.png)
![clock-rs, unimatrix, cava and swaync](screenshots/image_2.png)
![TUI code editor (LunarVim)](screenshots/image_3.png)

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
| cava      | Terminal Audio Visualizer                  | `pipewire`   |
| clock-rs  | CLI clock                                  | N/A          |
| waybar    | Status bar                                 | `swaync`, `pacman-contrib`, `NetworkManager`, `network-manager-applet`, `brightnessctl`, `pavucontrol`, `python3`, `python-requests` |
| kitty     | Fast GPU-accelerated terminal              | `ttf-firacode-nerd` |
| fastfetch | System info                                | A nerd font, recommend: `ttf-firacode-nerd` |
| hypr      | hyprland window-manager and it's utilities |  `hyprlock`, `hyprshot`, `swaync`, `waybar`, `hyprsunset`, `kitty`, `thunar`, `wl-clipboard`, `rofi`, `cliphist` |
| swaync    | Notification center                        |`hyprlock`, `network-manager-applet`, `blueman`, `obs-studio`, `pavucontrol` |
| rofi      | Dynamic Menu                               | `cliphist`, `rofi-emoji`, `noto-fonts-emoji` |

## Key-bindings

### Applications
| Action | Keybinding |
|--------|------------|
| Terminal (`$terminal`) | `Super` + `Q` |
| File Manager (`$fileManager`) | `Super` + `E` |
| Brave Browser | `Super` + `B` |
| wlogout | `Super` + `Shift` + `E` |
| hyprshutdown / Hyprland exit | `Super` + `M` |

### Screenshots (hyprshot)
| Action | Keybinding |
|--------|------------|
| Full output | `Super` + `Shift` + `F` |
| Window | `Super` + `Shift` + `W` |
| Region | `Super` + `Shift` + `R` |

### Rofi
| Action | Keybinding |
|--------|------------|
| App Launcher | `Super` + `D` |
| Clipboard History (cliphist) | `Super` + `Shift` + `V` |
| Emoji Picker | `Super` + `G` |
| `$menu` | `Super` + `R` |

### Window Management
| Action | Keybinding |
|--------|------------|
| Kill active window | `Super` + `C` |
| Toggle floating | `Super` + `V` |
| Pseudo (dwindle) | `Super` + `P` |
| Toggle split (dwindle) | `Super` + `J` |
| SwayNC notification panel | `Super` + `N` |

### Focus
| Action | Keybinding |
|--------|------------|
| Focus left | `Super` + `←` |
| Focus right | `Super` + `→` |
| Focus up | `Super` + `↑` |
| Focus down | `Super` + `↓` |

### Resize
| Action | Keybinding |
|--------|------------|
| Expand right | `Super` + `Shift` + `→` |
| Shrink left | `Super` + `Shift` + `←` |
| Shrink up | `Super` + `Shift` + `↑` |
| Expand down | `Super` + `Shift` + `↓` |

### Workspaces
| Action | Keybinding |
|--------|------------|
| Switch to workspace 1–10 | `Super` + `1`–`0` |
| Move window to workspace 1–10 | `Super` + `Shift` + `1`–`0` |
| Toggle special workspace (magic) | `Super` + `S` |
| Move window to special workspace | `Super` + `Shift` + `S` |
| Next workspace (scroll) | `Super` + `Scroll Down` |
| Previous workspace (scroll) | `Super` + `Scroll Up` |
