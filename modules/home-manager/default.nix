{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./bat.nix
    ./direnv.nix
    ./dotfiles
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./nushell.nix
    ./nvim
    ./shell.nix
    ./ssh.nix
    ./tldr.nix
    ./tmux.nix
    ./vscode-remote
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  services.vscode-server.enable = true;

  home = let
    NODE_GLOBAL = "${config.home.homeDirectory}/.node-packages";
  in {
    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    stateVersion = "22.05";
    sessionVariables = {
      GPG_TTY = "/dev/ttys000";
      EDITOR = "nvim";
      VISUAL = "nvim";
      CLICOLOR = 1;
      LSCOLORS = "ExFxBxDxCxegedabagacad";
      KAGGLE_CONFIG_DIR = "${config.xdg.configHome}/kaggle";
      NODE_PATH = "${NODE_GLOBAL}/lib";
    };
    sessionPath = [
      "${NODE_GLOBAL}/bin"
      "${config.home.homeDirectory}/.rd/bin"
      "${config.home.homeDirectory}/.local/bin"
    ];

    # define package definitions for current user environment
    packages = with pkgs; [
      # age
      alejandra
      cachix
      cb
      conan
      coreutils-full
      curl
      diffutils
      graphviz
      fd
      ffmpeg
      findutils
      gawk
      gnugrep
      gnupg
      gnused
      httpie
      ncdu
      neofetch
      nix
      nix-du
      nixfmt
      nixpkgs-fmt
      nodejs-18_x
      nodejs-18_x.pkgs.pnpm
      pre-commit
      # python with default packages
      (python3.withPackages
        (ps:
          with ps; [
            numpy
            scipy
            matplotlib
            networkx
          ]))
      rsync
      (ruby.withPackages (ps: with ps; [rufo solargraph]))
      stylua
      sysdo
      tree
      treefmt
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
    dircolors.enable = true;
    go.enable = false;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    java = {
      enable = true;
      package = pkgs.jdk17;
    };
    k9s.enable = false;
    lazygit.enable = false;
    less.enable = true;
    man.enable = true;
    nix-index.enable = true;
    pandoc.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    yt-dlp.enable = false;
    zathura.enable = true;
    zoxide.enable = true;
  };
}
