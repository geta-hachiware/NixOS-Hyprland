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
          "mpris"
          "custom/swaync"
          "tray"
          "cava"
        ];
        modules-center = [
          "clock"
          "hyprland/window"
        ];
        modules-right = [
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
          format = "{icon}";
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
          on-scroll-up = "~/.config/hypr/scripts/Brightness.sh --inc";
          on-scroll-down = "~/.config/hypr/scripts/Brightness.sh --dec";
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
          on-click-right = "~/.config/hypr/scripts/wlogout.sh";
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
          on-click = "gnome-system-monitor";
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
          format = "{player_icon} « {artist} - {title} »";
          format-paused = "{status_icon} [{artist} - {title}]";
          on-click-middle = "playerctl play-pause";
          on-click = "playerctl previous";
          on-click-right = "playerctl next";
          scroll-step = 5.0;
          on-scroll-up = "~/.config/hypr/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.config/hypr/scripts/volume_control.sh --dec";
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
          on-click-right = "~/.config/hypr/scripts/volume_control.sh --toggle";
          on-click = "pavucontrol -t 3";
          on-scroll-up = "~/.config/hypr/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.config/hypr/scripts/volume_control.sh --dec";
	        tooltip-format = "{icon} {desc} | {volume}%";
          smooth-scrolling-threshold = 1;
        };

        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          on-click-right = "~/.config/hypr/scripts/volume_control.sh --toggle-mic";
          on-click = "pavucontrol -t 4";
          on-scroll-up = "~/.config/hypr/scripts/volume_control.sh --mic-inc";
          on-scroll-down = "~/.config/hypr/scripts/volume_control.sh --mic-dec";
	        tooltip-format = "{source_desc} | {source_volume}%";
          scroll-step = 5;
        };

        # Temperature
        temperature = {
          interval = 10;
          tooltip = true;
          hwmon-path = [ "/sys/class/hwmon/hwmon1/temp1_input" "/sys/class/thermal/thermal_zone0/temp" ];
          critical-threshold = 82;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = ["󰈸"];
        };

        "wireplumber" = {
          format = "{icon} {volume} %";
          format-muted = " Mute";
          on-click-right = "~/.config/hypr/scripts/volume_control.sh --toggle";
          on-click = "pavucontrol -t 3";
          on-scroll-up = "~/.config/hypr/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.config/hypr/scripts/volume_control.sh --dec";
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

        "tray" = {
          icon-size = 15;
          spacing = 8;
        };

        "custom/menu" = {
          format = "{}";
          exec = "echo ; echo 󱓟 app launcher";
          interval = 86400; # once every day
          tooltip = true;
          on-click = "~/.geta/home/rofi/launcher/launcher.sh";
          on-click-middle = "~/.geta/Scripts/wal.sh";
          on-click-right = "~/.config/hypr/scripts/WaybarLayout.sh";
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
          on-scroll-up = "~/.config/hypr/scripts/volume_control.sh --inc";
          on-scroll-down = "~/.config/hypr/scripts/volume_control.sh --dec";
          smooth-scrolling-threshold = 1;
        };

        "custom/power" = {
          format = "⏻ ";
          exec = "echo ; echo 󰟡 power # blur";
          on-click = "~/.config/hypr/scripts/wlogout.sh";
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

        "custom/weather" = {
          format = "{}";
          format-alt = "{alt}: {}";
          format-alt-click = "click";
          interval = 3600;
          return-type = "json";
          exec = "~/.config/hypr/scripts/Weather.sh";
          #exec = "~/.config/hypr/scripts/Weather.py";
          exec-if = "ping wttr.in -c1";
          tooltip = true;
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
