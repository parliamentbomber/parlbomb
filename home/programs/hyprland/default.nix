{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./execonce.nix
    ./settings.nix
    ./rules.nix
    ./binds.nix
    ../wayland/anyrun
    ../wayland/waybar
    ./hypridle.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.default;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      inputs.hyprland-plugins.packages.${pkgs.system}.hyprexpo
    ];
    systemd = {enable = true;};
  };
  home.packages = with pkgs; [
    grimblast
    #inputs.self.packages.${pkgs.system}.wl-ocr
    clipse
    wl-clipboard
    swayosd
    swww
    nautilus
  ];
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    HYPRCURSOR_THEME = "macOS";
  };
}
