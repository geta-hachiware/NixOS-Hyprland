{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nano
    git
    vim
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
        serif = ["JetBrainsMono Nerd Font"];
        sansSerif = ["JetBrainsMono Nerd Font"];
        monospace = ["JetBrainsMono Nerd Font Mono"];
      };
    };
  };
}
