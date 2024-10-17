{
  pkgs,
  self,
  # inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../system
    ../../system/core/bootloader.nix
  ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
  environment.systemPackages = with pkgs; [];
  services = {
    displayManager.ly = {
      enable = true;
    };
  };

  networking.hostName = "pessima";
  security.pam.services = {
    ly = {
      enableGnomeKeyring = true;
    };
    login = {
      enableGnomeKeyring = true;
    };
  };
  security.tpm2.enable = true;
  services = {
    fstrim.enable = true;
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';
  };
}
