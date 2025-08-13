{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    curl
    git
    vim
    bluez
    bluez-tools
    wireplumber
    iproute2
    wirelesstools
    iputils
    polkit_gnome
  ];

  services.flatpak.enable = true;

  # Fonts system
  fonts.fontDir.enable = true;
  fonts = {
    packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      nerd-fonts.lekton
      corefonts
      material-icons
      font-awesome
      fira-code-symbols
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Lekton Nerd Font"];
        sansSerif = ["Lekton Nerd Font"];
        monospace = ["Lekton Nerd Font Mono"];
      };
    };
  };
}
