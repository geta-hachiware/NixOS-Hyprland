{ config, ... }:
{
# Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
    extraConfig.pipewire-pulse."10-stream-audio" = {
      "context.modules" = [
        { name = "libpipewire-module-loopback";
          args = {
            "capture.props" = {
              "node.name" = "Game-Audio-Capture";
              "media.class" = "Audio/Source";
            };
            "playback.props" = {
              "node.name" = "Game-Audio-Playback";
            };
          };
        }
      ];
    };

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
