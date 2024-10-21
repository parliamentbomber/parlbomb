{
  pkgs,
  config,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/hardware/nvidia.nix
    ../../system/core/bootloader.nix
  ];
  environment.systemPackages = with pkgs; [
  ];
  services = {
    displayManager.ly = {
      enable = true;
    };
  };

  security.pam.services = {
    ly = {
      enableGnomeKeyring = true;
    };
    login = {
      enableGnomeKeyring = true;
    };
  };

  networking.hostName = "digglydoo";

  security.tpm2.enable = true;

  services = {
    fstrim.enable = true;
  };
}
