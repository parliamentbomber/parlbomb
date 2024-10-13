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
    ../../system/core/lanzaboote.nix
  ];
  environment.systemPackages = with pkgs; [
  ];
  services.xserver = {
    enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
  };

  # unlock GPG keyring on login
  security.pam.services.gdm.enableGnomeKeyring = true;
  security.pam.services.login.enableGnomeKeyring = true;

  networking.hostName = "digglydoo";

  security.tpm2.enable = true;

  services = {
    fstrim.enable = true;
  };
}
