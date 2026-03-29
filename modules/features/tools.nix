{ self, ... }: {
  perSystem = { pkgs, self', ... }: 
  let
    # 1. Taskbook (wrapped)
    taskbook-wrapped = pkgs.writeShellScriptBin "tb" ''
      exec ${pkgs.taskbook}/bin/tb "$@"
    '';

    # 2. Neovim (thin wrapper)
    nvim-wrapped = pkgs.writeShellScriptBin "nvim" ''
      exec ${pkgs.neovim}/bin/nvim "$@"
    '';
  in {
    packages.myTools = pkgs.symlinkJoin {
      name = "myTools";
      paths = [
        self'.packages.fastfetch
        self'.packages.btop
        self'.packages.starship
        taskbook-wrapped
        nvim-wrapped
        pkgs.yazi
        pkgs.eza
        pkgs.fd
        pkgs.ripgrep
        pkgs.bat
        pkgs.git
        pkgs.nh
      ];
    };
  };

  flake.nixosModules.tools = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.myTools
    ];
  };
}
