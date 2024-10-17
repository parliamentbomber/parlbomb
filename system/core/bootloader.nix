{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.minegrub.nixosModules.default
  ];
  boot = {
    extraModprobeConfig = ''
      options iwlwifi 11n_disable=8
    '';
    kernelPackages = pkgs.pkgs.linuxPackages_latest;
    kernelModules = ["kvm-intel"];
    supportedFilesystems = ["ntfs"];
    loader = {
      systemd-boot.enable = false;
      efi.efiSysMountPoint = "/boot";
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        minegrub-world-sel-theme.enable = true;
      };
    };
  };
}
