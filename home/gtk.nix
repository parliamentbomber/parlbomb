{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    dconf
  ];
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };
  };
  home.pointerCursor = {
    name = "macOS-Monterey";
    size = 22;
    package = pkgs.apple-cursor;
    gtk.enable = true;
  };
  gtk = {
    cursorTheme = {
      name = "macOS-Monterey";
      package = pkgs.apple-cursor;
      size = 22;
    };
    enable = true;
    iconTheme = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
    };
    font = {
      name = "Torus Pro";
      package = pkgs.torus;
      size = 9;
    };
    theme = {
      name = "Kanagawa-BL";
      package = pkgs.kanagawa-gtk-theme;
    };
  };
}
