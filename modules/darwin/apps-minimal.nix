{ config, lib, pkgs, ... }: {
  homebrew = {
    casks = [
      "alt-tab"
      "bartender"
      "firefox-beta"
      "raycast"
      "stats"
      "visual-studio-code"
    ];
  };
}
