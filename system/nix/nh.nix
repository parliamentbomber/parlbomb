{
  pkgs,
  inputs,
  config,
  ...
}: {
  # nh default flake
  environment.variables.FLAKE = "${config.users.users.parliamentbomber.home}/parlbomb";

  programs.nh = {
    enable = true;
    package = inputs.nh.packages.${pkgs.system}.default;

    clean = {
      enable = true;
      extraArgs = "--keep-since 30d";
    };
  };
}
