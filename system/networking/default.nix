{lib, ...}:
# networking configuration
{
  imports = [
    ./tailscale.nix
    ./avahi.nix
  ];
  networking = {
    # use quad9 with DNS over TLS
    nameservers = ["1.1.1.1" "1.1.0.1"];
    firewall.allowedTCPPorts = [57621];

    networkmanager = {
      enable = true;
      wifi = {
        powersave = lib.mkForce false;
        macAddress = "random";
      };
    };
  };

  services = {
    openssh = {
      enable = true;
      settings.UseDns = true;
    };
  };
}
