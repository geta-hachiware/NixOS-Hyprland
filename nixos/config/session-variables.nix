{ config, pkgs, ...}:
{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "ghostty";
  };
  xdg.portal = {
    enable = true;
    config.common.default = "hyprland";
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
