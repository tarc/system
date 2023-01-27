{ inputs, config, pkgs, ... }: {
  homebrew = {
    enable = true;
    global = {
      brewfile = true;
      lockfiles = false;
    };
    brews = [
    ];
    onActivation = {
      autoUpdate = false;
    };
    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
    ];
    casks = [
    ];
  };
}
