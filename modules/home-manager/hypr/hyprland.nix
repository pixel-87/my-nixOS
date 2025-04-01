{ config, lib, pkgs, ... }:

{
  # User-level Hyprland configuration
  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../../modules/nixos/hypr/hyprland.conf;
    };
  # User-level Hyprland packages
  home.packages = with pkgs; [
    # Add any specific Hyprland-related packages you need
    # For example: wl-clipboard xdg-desktop-portal-hyprland
  ];
}
