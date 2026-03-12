{ inputs, self, ... }: {
  perSystem = { pkgs, ... }: 
  let
    inherit (self) theme;
    # Simple btop config that points to the stylix-generated theme if possible,
    # but for a wrapper we'll just set some basic comfy defaults.
    wrappedBtop = (inputs.wrappers.wrapperModules.btop.apply {
      inherit pkgs;
      "btop.conf".content = ''
        color_theme = "TTY"
        theme_background = False
        truecolor = True
        force_tty = False
        presets = "cpu:0:default,mem:0:default,net:0:default,proc:0:default"
        graph_symbol = "braille"
        proc_sorting = "cpu lazy"
        proc_reversed = False
        proc_tree = False
        proc_colors = True
        proc_gradient = True
        proc_per_core = False
        proc_mem_bytes = True
        proc_cpu_graphs = True
        proc_info_knob = True
        proc_left = False
        proc_filter_kernel = False
        cpu_graph_upper = "total"
        cpu_graph_lower = "total"
        cpu_invert_lower = True
        cpu_single_graph = False
        cpu_bottom = False
        mem_graphs = True
        mem_below_net = False
        zfs_arc_stats = True
        show_disks = True
        show_io_stat = True
        io_mode = False
        io_graph_combined = False
        io_graph_speeds = ""
        net_download = 100
        net_upload = 100
        net_auto_max = True
        net_sync = True
        net_iface = ""
        show_battery = True
        selected_battery = "Auto"
        log_level = "WARNING"
      '';
    }).wrapper;
  in {
    packages.btop = wrappedBtop;
  };

  flake.nixosModules.btop = { pkgs, ... }: {
    environment.systemPackages = [
      self.packages.${pkgs.stdenv.hostPlatform.system}.btop
    ];
  };
}
