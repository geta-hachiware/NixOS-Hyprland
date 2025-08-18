{
  pkgs,
  config,
  ...
}:
{
  # Configure Kitty
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;
    font.name = "Lekton Nerd Font Mono";
    font.size = 12;
    settings = {
      scrollback_lines = 2000;
      wheel_scroll_min_lines = 1;
      confirm_os_window_close = 0;
      window_padding_width = 5;
      window_border_width = 1.5;
      background_opacity = 1;
      enable_audio_bell = false;
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
    };
    keybindings = {
      "alt+j" = "next_window";
      "alt+k" = "previous_window";
      "alt+h" = "previous_tab";
      "alt+l" = "next_tab";
      "alt+enter" = "new_window_with_cwd";
      "alt+q" = "close_window";
      "ctrl+shift+U" = "none"; #for vim's page up
    };
    extraConfig = ''
      include $HOME/.cache/wal/colors-kitty.conf
      enabled_layouts fat:bias=80;full_size=1
      adjust_column_width -10
    '';
  };
}
