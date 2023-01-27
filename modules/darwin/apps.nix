{
  config,
  lib,
  pkgs,
  ...
}: {
  homebrew = {
    casks = [
      "adobe-acrobat-reader"
      "gimp"
      "skype"
      "telegram"
      "transmission"
      "vlc"
      "whatsapp"
      "visual-studio-code"
      "yacreader"
      "zoom"
    ];
    masApps = {};
  };
}
