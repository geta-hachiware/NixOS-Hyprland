{ config, pkgs, ...}:

{  
  programs.waybar = {
    enable = true;
    settings = {
      waybar = {
        style = "${config.xdg.configHome}/waybar/style.css";
        layer = "top";
        exclusive = true;
        passthrough = false;
        position = "top";
        spacing = 6;
        fixed-center = true;
        ipc = true;
        margin-top = 3;
        margin-left = 8;
        margin-right = 8;
        modules-left = [ 
          "custom/menu"
          "custom/separator#blank_2"
          "hyprland/workspaces#kanji"
          "custom/separator#blank_2"
          "custom/swaync"
          "group/tray"
          "mpris"
          "cava"
        ];
        modules-center = [
          "clock"
          "hyprland/window"
        ];
        modules-right = [ 
          "privacy"
          "group/motherboard"
          "custom/separator#blank_2"
          "group/laptop"
          "custom/separator#blank_2"
          "group/audio"
          "custom/separator#blank_2"
          "custom/power"
        ]; 
        # HYPRLAND WORKSPACES. CHOOSE as desired and place on waybar configs
        # Kanji/Japanese
        "hyprland/workspaces#kanji" = {
          disable-scroll = true;
          all-outputs = true;
          show-special = true;
          format = "{icon} <span font_size='8pt'>{windows}</span>";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
          format-icons = {
            "1" = "一";
            "2" = "二";
            "3" = "三";
            "4" = "四";
            "5" = "五";
            "6" = "六";
            "7" = "七";
            "8" = "八";
            "9" = "九";
            "10" = "十";
          };
          "window-rewrite-default" = "";
			    "window-rewrite" = {
				    "class<firefox>" = "";
					  "class<firefox> title<.*github.*>" = "";			
					  "class<firefox> title<.*youtube.*>" = "";
					  "class<firefox> title<Picture-in-Picture>" = "";
				    "sterminal" = "";
            "kitty" = "";
            "ghostty" = "";
            "alacritty" = "";
					  "class<kitty> title<vim.*>" = "";
				    "class<UnrealEditor> title<.+>" = "<span font_size='10pt'>󰦱</span>";
				    "class<UnrealEditor> title<>" = "";
				    "class<io.github.achetagames.epic_asset_manager>" = "";
            "obsidian" = "󰠮";
            "thunar" = "";
            "spotify" = "";
				    "code" = "󰨞";
				    "title<btop>" = "󰊚";
				    "KeePassXC" = "";
				    "Rofi" = "";
            "music" = "";
            "nautilus" = "";
            "Qalculate!" = "";
            "com.stremio.stremio" = "󱜅";
            "steam" = "";
            "discord" = "";
            "heroic" = "";
				    "hl2_linux" = "";
				    "class<Minecraft Launcher" = "";
					  "class<(Minecraft\\s\\d\\.\\d+\\.\\d+)>" = "";
				    "class<(steam_proton)>" = "";
				    "class<(steam_app_.*)>" = "";
			    };
        };

        # GROUP
        "group/motherboard" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
            "temperature"
            "disk"
          ];
        };
  
        "group/laptop" = {
          orientation = "horizontal";
          modules = [
            "backlight"
            "battery"
           ];	
        };
  
        "group/audio" = {
          orientation = "horizontal";
          modules = [
            "pulseaudio"
            "pulseaudio#microphone"
          ];	
        };

        "group/tray" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = true;
			   	  children-class = "tray-element";
          };
          modules = ["custom/tray-icon" "tray"];
	    	};

        backlight = {
          interval = 2;
          align = 0;
          rotate = 0;
          #format = "{icon} {percent}%";
          format-icons = [ " " " " " " "󰃝 " "󰃞 " "󰃟 " "󰃠 " ];
          format = "{icon}";
          #format-icons = [ "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" ];
          tooltip-format = "backlight {percent}%";
          icon-size = 10;
          on-click = "";
          on-click-middle = "";
          on-click-right = "";
          on-update = "";
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/Brightness.sh --inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/Brightness.sh --dec";
          smooth-scrolling-threshold = 1;
        };

        battery = {
          #interval = 5;
          align = 0;
          rotate = 0;
          #bat = "BAT1";
          #adapter = "ACAD";
          full-at = 100;
          design-capacity = false;
          states = {
            "good" = 95;
            "warning" = 30;
            "critical" = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "{capacity}%";
          format-plugged = "󱘖 {capacity}%";
	        format-alt-click = "click";
          format-full = "{icon} Full";
          format-alt = "{icon} {time}";
          format-icons = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
          format-time = "{H}h {M}min";
          tooltip = true;
          tooltip-format = "{timeTo} {power}w";
          on-click-right = "~/.geta/home/desktop/hyprland/scripts/wlogout.sh";
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂳";
          format-connected = "󰂱 {num_connections}";
          tooltip-format = " {device_alias}";
          tooltip-format-connected = "{device_enumerate}";
          tooltip-format-enumerate-connected = " {device_alias} 󰂄{device_battery_percentage}%";
          tooltip = true;
          on-click = "blueman-manager";
        };

        clock = {
          interval = 1;
          format = " {:%I:%M %p}"; # AM PM format
          #format = " {:%H:%M:%S}";
          format-alt = " {:%H:%M   %Y, %d %B, %A}";
          tooltip-format = "<tt><small>{calendar}</small></tt>";
          calendar = {
            "mode" = "year";
            "mode-mon-col" = 3;
            "weeks-pos" = "right";
            "on-scroll" = 1;
            format = {
              "months" =     "<span color='#ffead3'><b>{}</b></span>";
              "days" =       "<span color='#ecc6d9'><b>{}</b></span>";
              "weeks" =      "<span color='#99ffdd'><b>W{}</b></span>";
              "weekdays" =   "<span color='#ffcc66'><b>{}</b></span>";
              "today" =      "<span color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
        };              
        actions =  {
          on-click-right = "mode";
          on-click-forward = "tz_up";
          on-click-backward = "tz_down";
          on-scroll-up = "shift_up";
          on-scroll-down = "shift_down";
        };

        # Cpu
        cpu = {
          format = "{usage}% 󰍛";
          interval = 1;
          format-alt-click = "click";
          format-alt = " {icon0} {icon1} {icon2} {icon3} {usage}% 󰍛";
          format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
        };

        # Disk
        disk = {
          interval = 30;
          path = "/";
          format = "{percentage_used}% 󰋊";
          tooltip-format = "{used} used out of {total} on {path} ({percentage_used}%)";
        };

        "hyprland/language" = {
           format = "Lang: {}";
           format-en = "US";
           format-tr = "Korea";
           keyboard-name = "at-translated-set-2-keyboard";
           on-click = "hyprctl switchxkblayout $SET_KB next";
        };
        "hyprland/submap" = {
           format = "<span style=\"italic\">  {}</span>"; # Icon: expand-arrows-alt
           tooltip = false;
        };

        "hyprland/window" = {
          format = "{}";
          max-length = 40;
          separate-outputs = true;
          offscreen-css = true;
          offscreen-css-text = "(inactive)";
          rewrite = {
            "" = "/ᐠ - ˕ -マ Ⳋ ⋆｡°✩♬ ♪";
            "(.*) — Mozilla Firefox" = " $1";
            "(.*) - fish" = "> [$1]";
            "(.*) - zsh" = "> [$1]";
            "(.*) - ghostty" = "> [$1]";
          };
        };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            "activated" = " ";
            "deactivated" = " ";
          };
        };

        "keyboard-state" = {
          #numlock = true;
          capslock = true;
          format = {
            "numlock" = "N {icon}";
            "capslock" = "󰪛 {icon}";
          }; 
          format-icons = {
            "locked" = "";
            "unlocked" = "";
          };
        };

        # Memory
        memory = {
          interval = 10;
          format = "{used:0.1f}G 󰾆";
          format-alt = "{percentage}% 󰾆";
          format-alt-click = "click";
          tooltip = true;
          tooltip-format = "{used:.1f}GB/{total:.1f}GB";
        };

        mpris = {
          interval = 10;
          format = "{player_icon} {artist} - {title}";
          format-paused = "{status_icon} [{artist} - {title}]";
          artist-len = 15;
          title-len = 20;
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --dec";
          smooth-scrolling-threshold = 1;
          player-icons = {
				    chromium = "";
		        default = "";
            firefox = "";
            kdeconnect = "";
            mopidy = "";
		        mpv = "󰐹";
            spotify = "";
		        vlc = "󰕼";
		    	};
			    status-icons = {
			    	playing = "";
				    paused = "";
				    stopped = "";
			    };
          ignored-players = ["firefox"];
          max-length = 30;
        };

        network = {
          format = "{ifname}";
          format-wifi = "{icon}";
          format-ethernet = "󰌘";
          format-disconnected = "󰌙"; 
          tooltip-format = "{ipaddr}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰌘";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 50;
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        };
        "network#speed" = {
          interval = 1;
          format = "{ifname}";
          format-wifi = "{icon}  {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-ethernet = "󰌘   {bandwidthUpBytes}  {bandwidthDownBytes}";
          format-disconnected = "󰌙";
          tooltip-format = "{ipaddr}";
          format-linked = "󰈁 {ifname} (No IP)";
          tooltip-format-wifi = "{essid} {icon} {signalStrength}%";
          tooltip-format-ethernet = "{ifname} 󰌘";
          tooltip-format-disconnected = "󰌙 Disconnected";
          max-length = 50;
          format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        };
        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-bluetooth = "{icon} 󰂰 {volume}%";
          format-muted = "󰖁";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [ "" "" "󰕾" "" ]; 
            ignored-sinks = ["Easy Effects Sink"];
          };
          scroll-step = 5.0;
          on-click-right = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --toggle";
          on-click = "pavucontrol -t 3";
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --dec";
	        tooltip-format = "{icon} {desc} | {volume}%";
          smooth-scrolling-threshold = 1;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click-right = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --toggle-mic";
          on-click = "pavucontrol -t 4";
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --mic-inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --mic-dec";
	        tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        # Temperature
        temperature = {
          critical-threshold = 80;
          format = "{temperatureC}° ";
		      hwmon-path = "/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input";
          tooltip-format = "CPU: {temperatureC}°C";
        };

        "wireplumber" = {
          format = "{icon} {volume} %";
          format-muted = " Mute";
          on-click-right = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --toggle";
          on-click = "pavucontrol -t 3";
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --dec";
          format-icons = [ "" "" "󰕾" "" ];
        };

        "wlr/taskbar" = {
          format = "{icon} {name} ";
          icon-size = 15;
          all-outputs = false;
          tooltip-format = "{title}";
          on-click = "activate";
          on-click-middle = "close";
          ignore-list = [
            "wofi"
            "rofi"  
          ];
        };

        "custom/tray-icon" = {
          format = "";
          tooltip = true;
		      tooltip-format = "Tray"; 
			    rotate = 90;
	      };

        "tray" = {
          icon-size = 15;
          spacing = 8;
        };

        "privacy" = {
			    icon-spacing = 10;
			    icon-size = 13;
			    transition-duration = 250;
			    modules = [
				    {
					   type = "screenshare";
					   tooltip = true;
					   tooltip-icon-size = 24;
				    }
				    {
					   type = "audio-in";
					   tooltip = true;
					   tooltip-icon-size = 24;
				    }
			    ];
			    ignore-monitor = true;
			    ignore = [
				    {
					   type = "audio-in";
					   name = "cava";
            }
				    {
					   type = "screenshare";
					   name = "obs";
				    }
			    ];
		    };

        "custom/menu" = {
          format = "{}";
          exec = "echo ; echo 󱓟 app launcher";
          interval = 86400; # once every day
          tooltip = true;
          on-click = "~/.geta/home/rofi/launcher/launcher.sh";
          on-click-middle = "~/.geta/home/rofi/Wallpaperselect/wallpaper.sh";
          on-click-right = "~/.geta/home/desktop/hyprland/scripts/clipManager.sh";
        };

        "cava" = {
         framerate = 60;
         autosens = 1;
         bars = 10;
         lower_cutoff_freq = 50;
         higher_cutoff_freq = 10000;
         method = "pipewire";
         source = "auto";
         stereo = true;
         bar_delimiter = 0;
         noise_reduction = 0.77;
         input_delay = 2;
         hide_on_silence = true;
         format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
        };
         
        "custom/playerctl" = {
          format = "<span>{}</span>";
          return-type = "json";
          max-length = 35;
          exec = "playerctl -a metadata --format '{\"text\": \"{{artist}} ~ {{markup_escape(title)}}\", \"tooltip\": \"{{playerName}} : {{markup_escape(title)}}\", \"alt\": \"{{status}}\", \"class\": \"{{status}}\"}' -F";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          on-scroll-up = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.geta/home/desktop/hyprland/scripts/volume_control.sh --dec";
          smooth-scrolling-threshold = 1;
        };

        "custom/power" = {
          format = "⏻ ";
          exec = "echo ; echo 󰟡 power # blur";
          on-click = "~/.geta/home/desktop/hyprland/scripts/wlogout.sh";
          interval = 86400; # once every day
          tooltip = true;
        };

        "custom/swaync" = {
          tooltip = true;    
          format = "{icon} {}";
          format-icons = {
            "notification" = "<span foreground='red'><sup></sup></span>";
             "none" = "";
             "dnd-notification" = "<span foreground='red'><sup></sup></span>";
             "dnd-none" = "";
             "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
             "inhibited-none" = "";
             "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
             "dnd-inhibited-none" = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && swaync-client -t -sw";
          on-click-right = "swaync-client -d -sw";
          escape = true;
        };

        # Separator
        "custom/separator#blank_2" = {
	        format = "  ";
          interval = "once";
          tooltip = false;
        };
      };
    }; 
  };
}
