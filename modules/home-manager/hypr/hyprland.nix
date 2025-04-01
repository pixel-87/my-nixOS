{ config, lib, pkgs, ... }:

{
  # Use home.file to manage the config file
  home.file = {
    ".config/hypr/hyprland.conf" = {
      source = ../../../modules/nixos/hypr/hyprland.conf;
    };
  };
}
