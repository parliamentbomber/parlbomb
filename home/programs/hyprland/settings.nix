# ./hyprland.nix
{
  inputs,
  pkgs,
  config,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    # plugins = [ inputs.hyprspace.packages.${pkgs.system}.Hyprspace ];
    extraConfig = ''
      animations {
        enabled = false
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
          animation = windows, 1, 10, myBezier, slide
          animation = windowsOut, 1, 7, default, slide
          animation = border, 1, 10, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 7, default
          animation = workspaces, 1, 6, default, slide
      }
    '';
    settings = {
      monitor =
        lib.mapAttrsToList
        (
          name: m: let
            resolution = "${toString m.width}x${toString m.height}@${toString m.refreshRate}";
            position = "${toString m.x}x${toString m.y}";
          in "${name},${
            if m.enabled
            then "${resolution},${position},1"
            else "disable"
          }"
        )
        (config.monitors);
      debug = {
        disable_logs = false;
      };
      cursor = {
        no_hardware_cursors = true;
      };
      general = {
        resize_on_border = true;
        hover_icon_on_border = false;
        gaps_in = 0;
        gaps_out = 0;
        border_size = 0;
        layout = "dwindle";
      };
      input = {
        accel_profile = "flat";
        kb_layout = "us";
        touchpad = {
          natural_scroll = true;
          disable_while_typing = false;
          drag_lock = true;
          clickfinger_behavior = true;
        };
        sensitivity = 0;
      };
      gestures = {
        workspace_swipe = true;
      };
      decoration = {
        rounding = 0;
        blur = {
          passes = 2;
          size = 2;
          xray = true;
          special = true;
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        special_scale_factor = 0.9;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      render = {
        explicit_sync = true;
      };
      misc = {
        vrr = 2;
        close_special_on_empty = true;
        disable_hyprland_logo = 2;
        disable_splash_rendering = false;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(alacritty)$";
        new_window_takes_over_fullscreen = 2;
      };
    };
  };
}
