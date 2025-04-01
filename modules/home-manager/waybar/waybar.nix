{ config, lib, pkgs, ... }:

let
  # Read the config files directly - note the path is relative to THIS file
  waybarConfig = builtins.readFile ../../../modules/nixos/waybar/config.json;
  # waybarStyle = builtins.readFile ../../../modules/nixos/waybar/style.css;
in
{
  # User-level waybar configuration
  home.file = {
    ".config/waybar/config.json" = {
      text = waybarConfig;
    };
    
    #".config/waybar/style.css" = {
    #  text = waybarStyle;
    #};
  };
  
  # Make sure waybar is installed
  programs.waybar = {
    enable = true;
  };
}
