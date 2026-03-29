{ self, ... }: {
  perSystem = { pkgs, self', ... }: {
    packages.myShell = let
      # Create a configuration snippet in a directory structure Fish expects in XDG_CONFIG_DIRS
      nixConfig = pkgs.writeTextDir "fish/conf.d/00-nix.fish" ''
        set -g fish_greeting ""
        # Prepended PATH with myTools
        set -x PATH ${self'.packages.myTools}/bin $PATH
        
        # Aliases/functions defined inline
        alias ls='eza'
        alias grep='ripgrep'
        alias cat='bat'
        alias top='btop'
      '';
    in pkgs.runCommand "myShell" {
      nativeBuildInputs = [ pkgs.makeWrapper ];
    } ''
      mkdir -p $out/bin
      # Use --prefix XDG_CONFIG_DIRS instead of --set XDG_CONFIG_HOME
      # This allows Fish to find our declarative config while keeping XDG_CONFIG_HOME
      # pointing to a writable location (defaulting to ~/.config) for state/variables.
      makeWrapper ${pkgs.fish}/bin/fish $out/bin/fish \
        --prefix XDG_CONFIG_DIRS : ${nixConfig}
    '';
  };
}
