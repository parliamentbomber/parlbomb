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
  environment.systemPackages = with pkgs; [];
  services = {
    displayManager.ly = {
      enable = true;
    };
  };

  networking.hostName = "pessima";
  security.pam.sshAgentAuth.enable = true;
  security.tpm2.enable = true;
  services = {
    fstrim.enable = true;
    logind.extraConfig = ''
      HandlePowerKey=suspend
    '';
  };
}
