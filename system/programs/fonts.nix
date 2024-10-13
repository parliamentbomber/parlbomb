{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [font-manager];
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      lexend
      torus
      ipafont
      source-code-pro

      #mono
      jetbrains-mono

      #inputs.self.packages.${pkgs.system}.torus-pro
      (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
    fontconfig = {
      enable = true;
      cache32Bit = true;
      hinting.enable = true;
      antialias = true;
      defaultFonts = {
        monospace = ["Meslo LG M Regular Nerd Font Complete Mono"];
        serif = ["Torus Pro"];
        sansSerif = ["Torus Pro"];
      };
    };
  };
}
