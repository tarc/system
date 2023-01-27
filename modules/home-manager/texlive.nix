{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.texlive = {
    enable = true;
  };
}
