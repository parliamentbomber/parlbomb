{
  pkgs,
  config,
  inputs,
  lib,
  ...
}: {
  imports = [
    inputs.lanzaboote.nixosModules.lanzaboote
  ];
  boot = {
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=8
    '';
    kernelPackages = pkgs.pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
    supportedFilesystems = ["ntfs"];
    loader = {
      timeout = 15;
      systemd-boot = {
        enable = lib.mkForce false;
        consoleMode = "auto";
      };
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };
  };
}
