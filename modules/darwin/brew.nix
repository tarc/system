{...}: {
  homebrew = {
    enable = true;
    global = {
      brewfile = true;
    };
    brews = [
    ];

    taps = [
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/cask-versions"
      "homebrew/services"
    ];
    casks = [
      "alt-tab"
      "docker"
      "google-chrome"
      "visual-studio-code"
    ];
  };
}
