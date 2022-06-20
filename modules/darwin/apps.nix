{ config, lib, pkgs, ... }: {
  imports = [ ./apps-minimal.nix ];
  homebrew = {
    casks = [
      "fork"
      "gpg-suite"
      "iina"
      "skim"
      "syncthing"
    ];
    masApps = { };
  };
}
