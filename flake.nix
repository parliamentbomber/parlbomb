{
  description = "my computers";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {url = "git+https://github.com/hyprwm/hyprland?submodules=1";};
    nixos-anyrun-options = {
      url = "github:n3oney/anyrun-nixos-options";
    };
    nh = {
      url = "github:viperml/nh";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify = {url = "github:gerg-l/spicetify-nix";};
    anyrun = {
      url = "github:anyrun-org/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/8938e09db14d510dcc2f266e8b2e738ee527d386";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprsplit = {
      url = "github:shezdy/hyprsplit";
      inputs.hyprland.follows = "hyprland";
    };
    hyprgrass = {
      url = "github:horriblename/hyprgrass";
      inputs.hyprland.follows = "hyprland";
    };
    hyprspace = {
      url = "github:kzdkm/hyprspace";
      inputs.hyprland.follows = "hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
  in {
    formatter.x86_64-linux = pkgs.alejandra;
    nixosConfigurations = {
      digglydoo = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [./hosts/digglydoo];
      };
      lmp1 = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit self inputs;};
        modules = [./hosts/lmp1];
      };
    };
  };
}
