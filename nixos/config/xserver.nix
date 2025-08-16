{ config, ... }:
{
  services.xserver = {
    enable = true;
    deviceSection = ''Option "TearFree" "True"'';
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
