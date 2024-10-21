{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    windowrulev2 = [
      "float, class:^(imv)$"
      "workspace special:discord silent,class:^(WebCord)$"
      "workspace special:discord silent,class:^(discord)$"
      "workspace special:spotify silent,initialTitle:^(Spotify|Spotify Premium)$"
      "float,class:(qalculate-gtk)"
      "workspace special:calculator,class:(qalculate-gtk)"
      "stayfocused, title:^()$,class:^(steam)$"
      "minsize 1 1, title:^()$,class:^(steam)$"
      "float,class:(clipse)" # ensure you have a floating window class set if you want this behaviour
      "size 622 652,class:(clipse)" # set the size of the window as necessary
    ];
    layerrule = let
      layers = "^(anyrun|gtk-layer-shell|swayosd)$";
    in [
      "blur, ${layers}"
      "ignorealpha 0.2, ${layers}"
    ];
  };
}
