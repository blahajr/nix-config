

# My NixOS Config

[Built with Nix](https://nixos.org)

my Personal [NixOS](https://nixos.org/) and [Home Manager](https://github.com/nix-community/home-manager) flake — **thinkpad** (Hyprland with laptop) and **homelab** (headless)



## Hosts


| Host       | Role                              | default user | Hardware                         | Apply                                          |
| ---------- | --------------------------------- | ------------ | -------------------------------- | ---------------------------------------------- |
| `thinkpad` | Wayland desktop (SDDM & Hyprland) | `blahja`     | ThinkPad · i7-8650U · 16 GiB     | `sudo nixos-rebuild switch --flake .#thinkpad` |
| `homelab`  | Server (`192.168.1.50/24`)        | `root`       | OptiPlex 7040 · i7-6700 · 32 GiB | `sudo nixos-rebuild switch --flake .#homelab`  |


## Thinkpad


| Area             | Tools                                                                                   |
| ---------------- | --------------------------------------------------------------------------------------- |
| Compositor       | [Hyprland](https://hyprland.org/), hypridle, hyprlock, hyprshot, wlogout                |
| Bar & launcher   | [Waybar](https://github.com/Alexays/Waybar), [Rofi](https://github.com/davatorium/rofi) |
| Terminal & files | [Kitty](https://sw.kovidgoyal.net/kitty/), [Yazi](https://github.com/sxyazi/yazi)       |
| Shell            | [Zsh](https://www.zsh.org/) (oh-my-zsh), fzf, fastfetch                                 |
| Editor           | [Neovim](https://neovim.io/)                                                            |
| Notifications    | [Dunst](https://github.com/dunst-project/dunst)                                         |
| Wallpapers       | [Walt](https://github.com/gitfudge0/walt)                                               |
| Look             | Catppuccin mocha for majority                                                           |
| Dotfiles         | [blahajr/dotfiles](https://github.com/blahajr/dotfiles)                                 |


### Keybinds

keys are set inside of  `home/blahja/thinkpad/desktop/hypr/keybinds.nix`.
default mod key = **Super** (`$mod`).

Keybinds


| Key                           | Action                          |
| ----------------------------- | ------------------------------- |
| `Super + D` / `Super + Space` | Rofi launcher                   |
| `Super + T`                   | Kitty terminal                  |
| `Super + E`                   | Yazi                            |
| `Super + B`                   | Firefox                         |
| `Super + C`                   | Clipboard history → Rofi → copy |
| `Super + Q`                   | Close window                    |
| `Super + V`                   | Toggle floating                 |
| `Super + F`                   | Fullscreen                      |
| `Super + O`                   | Hyprlock                        |
| `Super + H/J/K/L`             | Focus left / down / up / right  |
| `Super + LMB` drag            | Move window                     |
| `Super + RMB` drag            | Resize window                   |


## layout

```text
├── assets
│   └── screenshots
├── flake.lock
├── flake.nix
├── home
│   ├── blahja
│   │   ├── base.nix
│   │   ├── shell.nix
│   │   └── thinkpad
│   │       ├── apps.nix
│   │       ├── default.nix
│   │       ├── desktop
│   │       │   ├── default.nix
│   │       │   ├── dunst.nix
│   │       │   ├── hypr
│   │       │   │   ├── hypridle.nix
│   │       │   │   ├── hyprland.nix
│   │       │   │   ├── hyprlock.nix
│   │       │   │   ├── keybinds.nix
│   │       │   │   ├── services.nix
│   │       │   │   ├── windowrules.nix
│   │       │   │   └── wlogout.nix
│   │       │   ├── rofi.nix
│   │       │   ├── theme
│   │       │   │   ├── appearance.nix
│   │       │   │   ├── default.nix
│   │       │   │   └── wallpaper.nix
│   │       │   ├── waybar
│   │       │   │   ├── style.nix
│   │       │   │   └── waybar.nix
│   │       │   └── yazi.nix
│   │       ├── games.nix
│   │       └── persistence.nix
│   ├── common
│   │   ├── default.nix
│   │   ├── dev
│   │   │   ├── default.nix
│   │   │   └── java.nix
│   │   └── packages.nix
│   └── root
│       └── default.nix
├── hosts
│   ├── homelab
│   │   ├── default.nix
│   │   ├── features
│   │   │   ├── adguard.nix
│   │   │   ├── default.nix
│   │   │   ├── minecraft.nix
│   │   │   └── nginx-proxy-manager.nix
│   │   ├── host.nix
│   │   └── network.nix
│   └── thinkpad
│       ├── default.nix
│       ├── features
│       │   ├── default.nix
│       │   ├── impermanence.nix
│       │   └── silent-sddm.nix
│       ├── hardware-configuration.nix
│       └── host.nix
├── modules
│   ├── home-manager
│   │   ├── default.nix
│   │   ├── desktop-env.nix
│   │   └── dotfiles.nix
│   ├── settings.nix
│   └── system
│       ├── core.nix
│       ├── homelab
│       │   ├── default.nix
│       │   ├── docker.nix
│       │   ├── network.nix
│       │   └── services
│       │       ├── adguard.nix
│       │       ├── default.nix
│       │       ├── minecraft-server.nix
│       │       └── nginx-proxy-manager.nix
│       ├── packages.nix
│       ├── security.nix
│       ├── ssh.nix
│       ├── thinkpad
│       │   ├── boot.nix
│       │   ├── default.nix
│       │   ├── desktop
│       │   │   ├── display.nix
│       │   │   └── hyprland.nix
│       │   ├── laptop.nix
│       │   └── network.nix
│       └── users.nix
└── README.md
```

