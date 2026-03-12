{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    wrappedStarship = (inputs.wrappers.wrapperModules.starship.apply {
      inherit pkgs;
      settings = {
        format = "$directory$git_branch$git_status$cmd_duration$character";
        directory.style = "bold #${theme.base0D}";
        character = {
          success_symbol = "[λ](bold #${theme.base0B})";
          error_symbol = "[λ](bold #${theme.base08})";
        };
      };
    }).wrapper;
  in {
    packages.starship = wrappedStarship;
  };

  flake.nixosModules.starship = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.starship
    ];
    programs.bash.interactiveShellInit = ''
      eval "$(${self.packages.${pkgs.stdenv.hostPlatform.system}.starship}/bin/starship init bash)"
    '';
  };
}
