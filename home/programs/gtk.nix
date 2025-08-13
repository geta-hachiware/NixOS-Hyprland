{ pkgs, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    font = {
      name = "Lekton Nerd Font Mono";
      size = 12;
    };

    gtk3.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
    gtk4.extraConfig = {
      "gtk-application-prefer-dark-theme" = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style = {
      name = "kvantum";
    };
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    hyprcursor = {
      enable = true;
      size = 28;
    };
    package = pkgs.openzone-cursors;
    name = "OpenZone_White_Slim";
  };
}
