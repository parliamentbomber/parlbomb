{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings.mainBar = lib.importJSON ./config.json;
  };
}
