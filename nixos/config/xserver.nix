{ config, pkgs, ... }:
{
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      enableHidpi = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      settings.Theme.CursorTheme = "Bibata-Modern-Classic";
      extraPackages = with pkgs; [
        kdePackages.qtmultimedia
        kdePackages.qtsvg
        kdePackages.qtvirtualkeyboard
      ];
    };
  };
  services = {
    xserver.enable = true;# Enable the X11 windowing system.
  };
}
