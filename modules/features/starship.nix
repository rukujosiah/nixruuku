{ self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    starship-config = pkgs.writeText "starship.toml" ''
      format = "$directory$git_branch$git_status$cmd_duration$character"
      [directory]
      style = "bold #${theme.base0D}"
      [character]
      success_symbol = "[λ](bold #${theme.base0B})"
      error_symbol = "[λ](bold #${theme.base08})"
    '';

    starship-wrapped = pkgs.runCommand "starship" {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      mkdir -p $out/bin
      makeWrapper ${pkgs.starship}/bin/starship $out/bin/starship \
        --set STARSHIP_CONFIG ${starship-config}
    '';
  in {
    packages.starship = starship-wrapped;
  };

  flake.nixosModules.starship = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.starship
    ];
    programs.bash.interactiveShellInit = ''
      eval "$(${self.packages.${pkgs.stdenv.hostPlatform.system}.starship}/bin/starship init bash)"
    '';
    programs.fish.interactiveShellInit = ''
      ${self.packages.${pkgs.stdenv.hostPlatform.system}.starship}/bin/starship init fish | source
    '';
  };
}
