{ config, lib, pkgs, ... }:

{
  # System-level Hyprland setup
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  
  # Add any system-wide hyprland-related packages
  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprpicker
    # Other tools
  ];
}
