{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [./nh.nix ./nixpkgs.nix ./subs.nix];

  # we need git for flakes
  environment.systemPackages = with pkgs; [git nixd];

  nix = {
    # pin the registry to avoid downloading and evaling a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;
    package = pkgs.lix;

    # set the path for channels compat
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      experimental-features = ["nix-command" "flakes"];
      flake-registry = "/etc/nix/registry.json";

      # for direnv GC roots
      keep-derivations = true;
      keep-outputs = true;
      warn-dirty = false;
      trusted-users = ["root" "@wheel"];
    };
  };
}
