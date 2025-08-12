{ config, pkgs, inputs, system, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "nate";
  home.homeDirectory = "/home/nate";
  home.stateVersion = "25.05";

  imports = [
    ./shell/zsh.nix
    ./desktop/hyprland/default.nix
    ./desktop/waybar/default.nix
    ./fastfetch/fastfetch.nix
    ./programs/bundle.nix
    ./pywal/pywal.nix
    ./rofi/default.nix 
  ];
     # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Audio players / controllers
    cava
    deadbeef
    pamixer
    playerctl
    pavucontrol
    sound-theme-freedesktop

    # Clipboard tools
    cliphist
    wl-clipboard

    # command-line Utilities
    curl
    findutils
    jq

    # Development / Programming
    python3
    python3Packages.requests
    inputs.nixvim.packages.${system}.default

    # Image Handling
    ffmpeg
    ffmpegthumbnailer
    imagemagick
    swappy

    # GTK / GUI / Theming
    libnotify
    nwg-look
    xdg-user-dirs

    # Network / Connectivity
    blueman
    networkmanagerapplet

    # Perfomance Monitoring
    btop
    gnome-system-monitor
    nvtopPackages.v3d

    # screenshot
    hyprshot
    swww
    slurp
    grimblast
    grim

    # Office Productivity
    libreoffice-qt6-fresh

    # other utilities
    brightnessctl
    swaynotificationcenter
    swaybg
    waypaper
    wlogout
    cmatrix
    imv
    hyprlock
    hypridle
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/hypr/scripts/volume_control.sh".source = ./desktop/hyprland/scripts/volume_control.sh;
    ".config/hypr/scripts/volume_control.sh".executable = true;
    ".config/hypr/scripts/Brightness.sh".source = ./desktop/hyprland/scripts/Brightness.sh;
    ".config/hypr/scripts/Brightness.sh".executable = true;
    ".config/hypr/scripts/wlogout.sh".source = ./desktop/hyprland/scripts/wlogout.sh;
    ".config/hypr/scripts/wlogout.sh".executable = true;
    ".config/hypr/scripts/toggle.sh".source = ./desktop/hyprland/scripts/toggle.sh;
    ".config/hypr/scripts/toggle.sh".executable = true;
    ".config/hypr/scripts/screenshot.sh".source = ./desktop/hyprland/scripts/screenshot.sh;
    ".config/hypr/scripts/screenshot.sh".executable = true;
    ".config/hypr/scripts/media_control.sh".source = ./desktop/hyprland/scripts/media_control.sh;
    ".config/hypr/scripts/media_control.sh".executable = true;
    ".config/hypr/scripts/Sounds.sh".source = ./desktop/hyprland/scripts/Sounds.sh;
    ".config/hypr/scripts/Sounds.sh".executable = true;
    ".config/hypr/scripts/clipManager.sh".source = ./desktop/hyprland/scripts/clipManager.sh;
    ".config/hypr/scripts/clipManager.sh".executable = true;
    ".config/hypr/scripts/songdetails.sh".source = ./desktop/hyprland/scripts/songdetails.sh;
    ".config/hypr/scripts/songdetails.sh".executable = true;
    ".config/hypr/hyprlock.conf".source = ./desktop/hyprland/templates/hyprlock.conf;
    ".config/hypr/hypridle.conf".source = ./desktop/hyprland/templates/hypridle.conf;

    ".config/rofi/themes/default.rasi".source = ./rofi/clipboard/default.rasi;
    ".config/rofi/themes/clipboard.rasi".source = ./rofi/clipboard/clipboard.rasi;

    ".config/wlogout/icons".source = ./desktop/wlogout/icons;
    ".config/wlogout/layout".source = ./desktop/wlogout/layout;
    ".config/wlogout/nova.css".source = ./desktop/wlogout/nova.css;
 
    # CSS colors 
    ".config/waybar/style.css".source = ./desktop/waybar/style.css; #waybar style css
    ".config/wal/templates".source = ./pywal/template;

    ".config/swaync/icons".source = ./desktop/swaync/icons;
    ".config/swaync/config.json".source = ./desktop/swaync/config.json;
    ".config/swaync/style.css".source = ./desktop/swaync/style.css;
    ".config/swaync/themes".source = ./desktop/swaync/themes;
    
    ".config/rofi/rofi-wallpaper-sel.rasi".source = ./rofi/Wallpaperselect/rofi-wallpaper-sel.rasi;
    ".local/bin/wallpaper" = {
      source = ./rofi/Wallpaperselect/wallpaper.sh;
      executable = true;
    };
    
    #".geta/home/rofi/image/makima.jpg".source = ./rofi/image/makima.jpg;
    ".config/rofi/launcher/rofi-launcher-config.rasi".source = ./rofi/launcher/rofi-launcher-config.rasi;
    ".local/bin/launcher" = {
      source = ./rofi/launcher/launcher.sh;
      executable = true;
    };
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.config/hypr/scripts"
  ];
  
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
