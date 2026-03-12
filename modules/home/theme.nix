{ config, pkgs, ... }:

{
  home.file.".config/quickshell/noctalia".source = ./../../config/noctalia;
}
