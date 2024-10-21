{
  lib,
  pkgs,
  config,
  ...
}: {
  wayland.windowManager.hyprland = {
    settings = {
      exec-once = [
        "${pkgs.waybar}/bin/waybar"
        "spotify"
        "${pkgs.webcord-vencord}/bin/webcord"
        "${pkgs.swww}/bin/swww init"
        "${pkgs.swayosd}/bin/swayosd-server"
        "${pkgs.clipse}/bin/clipse -listen"
        "systemctl --user import-environment PATH"
        "hyprctl setcursor macOS 22"
        # Example: bind = SUPER, V, exec, alacritty --class clipse -e 'clipse'
      ];
    };
  };
}
