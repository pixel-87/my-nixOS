{ config, pkgs, ... }:

{
  # Enable Hyprland window manager
  programs.hyprland = {
    enable = true;
    # System-wide Hyprland settings can go here
    xwayland.enable = true;
  };

  # Essential services for proper Wayland/Hyprland operation
  security.polkit.enable = true;
  hardware.opengl.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Additional Hyprland configuration
  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
}
