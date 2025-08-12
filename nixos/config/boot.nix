{ config, pkgs, ... }:
{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      #grub = {
      #enable = true;
      #device = "nodev";
      #efiSupport = true;
      #useOSProber = true;
      #}; 
    };
    initrd.kernelModules = [
      "nvme"
      "nvidia"
    ];
  };
}
