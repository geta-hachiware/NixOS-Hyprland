{ config, pkgs, ... }: 

{
  stylix = {
    enable = true;
    polarity = "dark";
    image = "${config.home.homeDirectory}./current_wallpaper";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["Lekton"];};
        name = "Lekton Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
      sizes = {
        applications = 13;
        desktop = 13;
        popups = 14;
        terminal = 15;
      };
    };
    opacity = {
      terminal = 0.90;
      popups = 0.85;
      desktop = 0.80;
    };
    cursor = {
      package = pkgs.phinger-cursors;
      name = "phinger-cursors-light";
      size = 28;
    };
  };
}
