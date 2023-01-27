{
  inputs,
  config,
  pkgs,
  ...
}: {
  homebrew = {
    enable = true;
    global = {
      brewfile = true;
    };
    brews = [];

    taps = [
      "homebrew/bundle"
      "homebrew/cask"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/core"
      "homebrew/services"
    ];
    casks = [
      "1password"
      "1password-cli"
      "alt-tab"
      "appcleaner"
      "bartender"
      "docker"
      "firefox-developer-edition"
      "fork"
      "google-chrome"
      "gpg-suite"
      "hammerspoon"
      "hot"
      "iina"
      "intellij-idea"
      "jetbrains-toolbox"
      "kitty"
      "obsidian"
      "raycast"
      # "rancher"
      "stats"
      "utm"
      "visual-studio-code"
      "zotero"
    ];
  };
}
