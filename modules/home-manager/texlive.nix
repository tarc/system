{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.texlive = {
    enable = true;
    extraPackages = tpkgs:  {
      inherit (tpkgs)
        scheme-medium
        dvisvgm
        dvipng
        wrapfig
        amsmath
        ulem
        hyperref
        capt-of
        moderncv
        multirow
        fontspec
        fontawesome
        fontawesome5
        arydshln
    };
  };
}
