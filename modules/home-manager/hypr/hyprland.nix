{ config, lib, pkgs, ... }:

{
  # Use home.file instead of programs.hyprland
  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../../modules/nixos/hypr/hyprland.conf;
    };
  };
    
  # Any user-specific packages needed for your Hyprland setup
  home.packages = with pkgs; [
    wl-clipboard
    rofi-wayland
    # Other tools
  ];
}
