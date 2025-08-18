{ pkgs, inputs, ... }:
  let
    spicePkgs = inputs.spicetify-nix.legacyPackages."x86_64-linux";
  in {
    programs.spicetify = {
      enable = true;
      # theme = spicePkgs.themes.text;
        theme = spicePkgs.themes.catppuccin;
      # theme = spicePkgs.themes.TokyoNight;
      # theme = spicePkgs.themes.defaultDynamic
      # Theme for catppuccin
        colorScheme = "mocha";
      # colorScheme = "Spotify";
      # colorScheme = "Spicetify";
      # colorScheme = "RosePine";
      # colorScheme = "CatppuccinMocha";
      # colorScheme = "TokyoNight";
      #  colorScheme = "Storm";
      # Theme for dynamic
      # colorScheme = "Base";
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle # shuffle+ (special characters are sanitized out of ext names)
          keyboardShortcut # vimium-like navigation
          copyLyrics # copy lyrics with selection
          queueTime
          history
          songStats
          featureShuffle
          phraseToPlaylist
          skipStats
          popupLyrics
          beautifulLyrics
          fullAppDisplay
          powerBar
          listPlaylistsWithSong
          volumePercentage
          autoSkipExplicit
          # autoVolume
          # showQueueDuration
          # hidePodcasts
        ];
        enabledCustomApps = with spicePkgs.apps; [
          lyricsPlus
          newReleases
        ];
  };
}
