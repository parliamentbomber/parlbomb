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
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
    };
  };
  networking.hostName = "pessima";
  security.pam.services.login.enableGnomeKeyring = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.tpm2.enable = true;
  services = {
    fstrim.enable = true;
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';
  };
}
