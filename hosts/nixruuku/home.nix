{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/core.nix
    ../../modules/home/shell.nix
    ../../modules/home/niri.nix
    ../../modules/home/yazi.nix
    ../../modules/home/theme.nix
  ];
}
