{ config, lib, pkgs, ... }:

{
  # System-level Hyprland configuration
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Enable XDG portal for screen sharing
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      xdg-desktop-portal-gtk
    ];
  };
}
