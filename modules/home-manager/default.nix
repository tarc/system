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
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

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
    stateVersion = "23.05";
    sessionVariables = {
      GPG_TTY = "/dev/ttys000";
      EDITOR = "nvim";
      VISUAL = "nvim";
      CLICOLOR = 1;
      LSCOLORS = "ExFxBxDxCxegedabagacad";
      KAGGLE_CONFIG_DIR = "${config.xdg.configHome}/kaggle";
      NODE_PATH = "${NODE_GLOBAL}/lib";
      JAVA_OPTS = "-Xmx4G";
    };
    sessionPath = [
      "${NODE_GLOBAL}/bin"
      "${config.home.homeDirectory}/.rd/bin"
      "${config.home.homeDirectory}/.local/bin"
    ];

    # define package definitions for current user environment
    packages = with pkgs; [
      alejandra
      cachix
      cb
      cirrus-cli
      comma
      conan
      coreutils-full
      coursier
      curl
      diffutils
      fd
      ffmpeg
      findutils
      flyctl
      gawk
      gnugrep
      gnupg
      gnused
      helm-docs
      httpie
      hurl
      kubectl
      kubectx
      kubernetes-helm
      kustomize
      lazydocker
      luajit
      mmv
      ncdu
      neofetch
      nix
      nixfmt
      nixpkgs-fmt
      nodejs-18_x
      parallel
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
      ranger
      rclone
      rsync
      (ruby.withPackages (ps: with ps; [rufo solargraph]))
      sbt
      shellcheck
      stylua
      sysdo
      terraform
      tree
      treefmt
      trivy
      vagrant
      yarn
      yq-go
    ];
  };

  programs = {
    home-manager = {
      enable = true;
    };
    dircolors.enable = true;
    go.enable = true;
    gpg.enable = true;
    htop.enable = true;
    jq.enable = true;
    java = {
      enable = true;
      package = pkgs.adoptopenjdk-bin;
    };
    k9s.enable = true;
    less.enable = true;
    man.enable = true;
    nix-index.enable = true;
    pandoc.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zathura.enable = true;
    zoxide.enable = true;
  };
}
