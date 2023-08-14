{
  inputs,
  config,
  pkgs,
  ...
}: {
  nixpkgs = {config = import ./config.nix;};

  nix = {
    package = pkgs.nix;
    extraOptions = ''
      auto-optimise-store = true
      keep-outputs = true
      keep-derivations = true
      experimental-features = nix-command flakes
    '';
    settings = {
      max-jobs = 4;
      trusted-users = ["${config.user.name}" "root" "@admin" "@wheel"];
      substituters = [
        "https://cache.nixos.org"
        "https://kclejeune.cachix.org"
        "https://tarc.cachix.org"
      ];
      trusted-substituters = [
        "https://cache.nixos.org"
        "https://kclejeune.cachix.org"
        "https://tarc.cachix.org"
        "https://lean4.cachix.org/"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "kclejeune.cachix.org-1:fOCrECygdFZKbMxHClhiTS6oowOkJ/I/dh9q9b1I4ko="
        "tarc.cachix.org-1:wIYVNrWvfOFESyas4plhMmGv91TjiTBVWB0oqf1fHcE="
        "lean4.cachix.org-1:mawtxSxcaiWE24xCXXgh3qnvlTkyU7evRRnGeAhD4Wk="
      ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };

    nixPath =
      builtins.map
      (source: "${source}=/etc/${config.environment.etc.${source}.target}") [
        "home-manager"
        "nixpkgs"
        "stable"
      ];
    registry = {
      nixpkgs = {
        from = {
          id = "nixpkgs";
          type = "indirect";
        };
        flake = inputs.nixpkgs;
      };
      stable = {
        from = {
          id = "unstable";
          type = "indirect";
        };
        flake = inputs.stable;
      };
    };
  };
}
