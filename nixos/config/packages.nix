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
    kdePackages.qtmultimedia
    kdePackages.qtsvg
    kdePackages.qtvirtualkeyboard
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
