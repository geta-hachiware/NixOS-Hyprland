{ config, pkgs, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      source = "$HOME/.cache/wal/colors-hyprland.conf";
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor = [ 
      "DP-1,1920x1080@144,0x0,1"
      ];

      #Start
      exec-once = [
        "waybar"
        "swaync"
        "swww-daemon"
        "nm-applet --indicator"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "polkit-agent-helper-1"
      ];

      # Refer to https://wiki.hyprland.org/Configuring/Variables/
      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "GDK_BACKEND,wayland,x11,*"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "MOZ_ENABLE_WAYLAND,1"
        "OZONE_PLATFORM,wayland"
        "EGL_PLATFORM,wayland"
        "CLUTTER_BACKEND,wayland"
        "SDL_VIDEODRIVER,wayland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "WLR_RENDERER_ALLOW_SOFTWARE,1"
        "NIXPKGS_ALLOW_UNFREE,1"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#general
      general = {
        gaps_in = 4;
        gaps_out = 6;
        "col.active_border" = "$color6 $color3 45deg";
        "col.inactive_border" = "rgba(000000A0)";
        resize_on_border = true;
        border_size = 2;
      	layout = "dwindle";
	      # allow_tearing = true; # Allow tearing for games (use immediate window rules for specific games or all titles)
      };

      # https://wiki.hyprland.org/Configuring/Variables/#decoration
      decoration = {
        rounding = 7 ;
        rounding_power = 2;
        
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          offset = "2 2";
        };

        blur = {
          enabled = true;
          special = true;
          size = 6;
          passes = 2;
	        new_optimizations = true;
          ignore_opacity = true;
          xray = false;
        };
      };

      group = {
        "col.border_active" = "$color6 $color3 45deg";
        "col.border_inactive" = "rgba(000000A0)";
        "col.border_locked_active" = "$color6 $color3 45deg";
        "col.border_locked_inactive" = "rgba(000000A0)";
      };

      workspace = [
        "1, monitor:DP-1, default:true"
      ];

      layerrule = [
        "blur, logout_dialog"
        "blur, class:^(swww)$"
        "blur, rofi"
        "blur, swaync-control-center"
        "blur, swaync-notification-window"
        
        "ignorezero, rofi"
        "ignorezero, swaync-control-center"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.5, swaync-control-center"
        "ignorealpha 0.5, swaync-notification-window"
      ];

      windowrule = [
        # Can use FLOAT FLOAT for active and inactive or just FLOAT
        "opacity 0.80 0.80,class:^(ghostty|kitty|alacritty|Alacritty|org.wezfurlong.wezterm)$"
        "opacity 0.90 0.90,class:^(gcr-prompter)$" # keyring prompt
        "opacity 0.90 0.90,title:^(Hyprland Polkit Agent)$" # polkit prompt
        "opacity 1.00 1.00,class:^(firefox)$"
        "opacity 0.90 0.90,class:^(Brave-browser)$"
        "opacity 0.80 0.80,class:^(thunar)$"
        "opacity 0.80 0.80,class:^(Steam)$"
        "opacity 0.80 0.80,class:^(steam)$"
        "opacity 0.80 0.80,class:^(steamwebhelper)$"
        "opacity 0.80 0.80,class:^(Spotify)$"
        "opacity 0.80 0.80,title:(.*)(Spotify)(.*)$"
        "opacity 0.80 0.80,class:^(VSCodium)$"
        "opacity 0.80 0.80,class:^(codium-url-handler)$"
        "opacity 0.80 0.80,class:^(code)$"
        "opacity 0.80 0.80,class:^(code-url-handler)$"
        "opacity 0.80 0.80,class:^(terminalFileManager)$"
        "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
        "opacity 0.80 0.80,class:^(org.kde.ark)$"
        "opacity 0.80 0.80,class:^(nwg-look)$"
        "opacity 0.80 0.80,class:^(qt5ct)$"
        "opacity 0.80 0.80,class:^(qt6ct)$"
        "opacity 0.80 0.80,class:^(yad)$"

        "opacity 0.80 0.80,class:^(com.obsproject.Studio)$" #Obs-Qt
        "opacity 0.80 0.80,class:^(gnome-boxes)$" #Boxes-Gtk
        "opacity 0.90 0.90,class:^(discord)$" #Discord-Electron
        "opacity 0.90 0.90,class:^(WebCord)$" #WebCord-Electron
        "opacity 0.80 0.80,class:^(app.drey.Warp)$" #Warp-Gtk
        "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
        "opacity 0.80 0.80,class:^(Signal)$" #Signal-Gtk
        "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
        
        "opacity 0.80 0.70,class:^(pavucontrol)$"
        "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
        "opacity 0.80 0.70,class:^(blueman-manager)$"
        "opacity 0.80 0.70,class:^(.blueman-manager-wrapped)$"
        "opacity 0.80 0.70,class:^(nm-applet)$"
        "opacity 0.80 0.70,class:^(nm-connection-editor)$"
        "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"

        "content game, tag:games"
        "tag +games, content:game"
        "tag +games, class:^(steam_app.*|steam_app_\d+)$"
        "tag +games, class:^(gamescope)$"
        "tag +games, class:(Waydroid)"
        "tag +games, class:(osu!)"
        
        # Games
        "syncfullscreen,tag:games"
        "fullscreen,tag:games"
        "noborder 1,tag:games"
        "noshadow,tag:games"
        "noblur,tag:games"
        "noanim,tag:games"
        
        "float,class:^(qt5ct)$"
        "float,class:^(nwg-look)$"
        "float,class:^(org.kde.ark)$"
        "float,class:^(Signal)$" #Signal-Gtk
        "float,class:^(com.github.rafostar.Clapper)$" #Clapper-Gtk
        "float,class:^(app.drey.Warp)$" #Warp-Gtk
        "float,class:^(net.davidotek.pupgui2)$" #ProtonUp-Qt
        "float,class:^(imv)$" #Imageviewer
        "float,class:^(io.gitlab.theevilskeleton.Upscaler)$" #Upscaler-Gtk
        "float,class:^(yad)$"
        "float,class:^(gnome-system-monitor)"
        "float,class:^(pavucontrol)$"
        "float,class:^(blueman-manager)$"
        "float,class:^(.blueman-manager-wrapped)$"
        "float,class:^(nm-applet)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      ];

      windowrulev2 = [
        "opacity 1.0 override, class:^.*, fullscreen:1"

        "opacity 0.95 0.75,title:^(Picture-in-Picture)$"
        "pin,title:^(Picture-in-Picture)$"
        "float, title:^(Picture-in-Picture)$"
        "size 25% 25%,title:^(Picture-in-Picture)$"
        "move 72% 7%,title:^(Picture-in-Picture)$"

        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"
      ];

      # https://wiki.hyprland.org/Configuring/Variables/#animations
      animations = {
        enabled = true;
        # Default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more
        bezier = [
          "overshot, 0.05, 0.9, 0.1, 1.05"
          "smoothOut, 0.36, 0, 0.66, -0.56"
          "smoothIn, 0.25, 1, 0.5, 1"
          "pace, 0.46, 1, 0.29, 0.99"
        ];
        animation = [
          "fade, 1, 3, smoothIn"
          "windowsIn, 1, 3, smoothIn"
          "windowsOut, 1, 3, smoothOut"
          "windowsMove, 1, 3, pace, slide"
          "workspaces, 1, 2, default"
          "layers, 1, 2, pace, slide"
          "specialWorkspace, 1, 3, pace, slidevert"
        ];
      };

      # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
      master = {
        new_status = "master";
      };
      
      render = {
        direct_scanout = true; # 0 = off, 1 = on, 2 = auto (on with content type ‘game’)
      };

      ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        vrr = 1; # enable variable refresh rate (0=off, 1=on, 2=fullscreen only)
        vfr = true;
        enable_swallow = true;
        swallow_regex = "^(kitty|alacritty)$";
      };
      
      xwayland = {
        force_zero_scaling = false;
      };

      gestures = {
        workspace_swipe = false;
      };

      #Device
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      
      # https://wiki.hyprland.org/Configuring/Variables/#input
      input = {

        #Keyboard
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        
        #Numlock
        numlock_by_default = true;  
        
        #Mouse
        follow_mouse = 1;
        force_no_accel = true;
        sensitivity = 0;

        #Touchpad
        touchpad = {
          natural_scroll = false;
        };
      };

      "$mainMod" = "SUPER";

      #Binds
      bind = [
        # Terminal App Launcher
        "$mainMod, Return, exec, kitty" # terminal
	      "$mainMod, Space, exec, launcher" # app launcher
        "$mainMod, T, exec, thunar" # file manager
        "$mainMod+Shift, C, exec, clipManager.sh" #clipboard
        "$mainMod, W, exec, wallpaper" # wallpaper picker
        "$mainMod+Shift, N, exec, swaync-client -t -sw" # swayNC panel

        # Screenshot/Screencapture
        "$mainMod+Shift, F12, exec, screenshot.sh --now"
        "$mainMod+Shift, K, exec, screenshot.sh --area"
        "$mainMod+Shift, J, exec, screenshot.sh --in5" # screenshot in 5 sec

        # Screenshot with swappy ( another screenshot tool )
        "$mainMod+Shift, S, exec, screenshot.sh --swappy"

        # Toggle focused window split
        "$mainMod, slash, togglesplit"

        # Scroll through existing workspaces
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"   

      	# Window Management
        "$mainMod, Q, killactive"
        "$mainMod+Shift, M, exit"
        "$mainMod, V, togglefloating"
        "$mainMod, P, pseudo"
        "$mainMod, F, fullscreen"

        # Move/Change window focus
        "$mainMod, Left, movefocus, l"  
        "$mainMod, Right, movefocus, r" 
        "$mainMod, Up, movefocus, u"    
        "$mainMod, Down, movefocus, d"  
        "Alt, Tab, movefocus, d"        
                                    
        "$mainMod, H, movefocus, l"     
        "$mainMod, L, movefocus, r"     
        "$mainMod, K, movefocus, u"     
        "$mainMod, J, movefocus, d"     
        "Alt, Tab, movefocus, d"

        # Switch workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Switch workspaces to a relative workspace
        "$mainMod+Ctrl, Down, workspace, r+1" #Vertical Workspaces
        "$mainMod+Ctrl, Up, workspace, r-1"
        "$mainMod+Ctrl, Right, workspace, r+1" #Horizontal Workspaces
        "$mainMod+Ctrl, Left, workspace, r-1"

        "$mainMod+Ctrl, j, workspace, r+1" #Vertical Workspaces
        "$mainMod+Ctrl, k, workspace, r-1"
        "$mainMod+Ctrl, l, workspace, r+1" #Horizontal Workspaces
        "$mainMod+Ctrl, h, workspace, r-1"

        # Move focused window to a workspace
        "$mainMod+Shift, 1, movetoworkspace, 1"
        "$mainMod+Shift, 2, movetoworkspace, 2"
        "$mainMod+Shift, 3, movetoworkspace, 3"
        "$mainMod+Shift, 4, movetoworkspace, 4"
        "$mainMod+Shift, 5, movetoworkspace, 5"
        "$mainMod+Shift, 6, movetoworkspace, 6"
        "$mainMod+Shift, 7, movetoworkspace, 7"
        "$mainMod+Shift, 8, movetoworkspace, 8"
        "$mainMod+Shift, 9, movetoworkspace, 9"
        "$mainMod+Shift, 0, movetoworkspace, 10"

     	# Move focused window to a workspace silently
        "$mainMod+Alt, 1, movetoworkspacesilent, 1"
        "$mainMod+Alt, 2, movetoworkspacesilent, 2"
        "$mainMod+Alt, 3, movetoworkspacesilent, 3"
        "$mainMod+Alt, 4, movetoworkspacesilent, 4"
        "$mainMod+Alt, 5, movetoworkspacesilent, 5"
        "$mainMod+Alt, 6, movetoworkspacesilent, 6"
        "$mainMod+Alt, 7, movetoworkspacesilent, 7"
        "$mainMod+Alt, 8, movetoworkspacesilent, 8"
        "$mainMod+Alt, 9, movetoworkspacesilent, 9"
        "$mainMod+Alt, 0, movetoworkspacesilent, 10"
       ];

       bindm = [
       # Move/Resize focused window
         "$mainMod, mouse:272, movewindow"   
         "$mainMod, mouse:273, resizewindow"
       ];

       #SpecialKey
       bindel = [
       # Laptop multimedia keys for volume and LCD brightness
         ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 2%+"
         ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"
         ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
         ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"                   
         ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
         ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
       ];

       #Multimedia
       bindl = [
       # Requires playerctl
         ", XF86AudioNext, exec, playerctl next"
         ", XF86AudioPause, exec, playerctl play-pause"
         ", XF86AudioPlay, exec, playerctl play-pause"
         ", XF86AudioPrev, exec, playerctl previous"
       ];
    };
  };
}
