{self, ...}: {
  nixpkgs = {
    config.allowUnfree = true;
    config.allowUnfreePredicate = _: true;
    config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}
