{ config, pkgs, lib, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" "nvme" ];
      kernelModules = [];
    };
    kernelModules = [ "nvidia" ];
    extraModulePackages = [];
    kernelParams = [
      "nvidia-drm.modeset=1"
      "loglevel=3"
    ];
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
