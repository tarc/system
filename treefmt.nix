{
  projectRootFile = "flake.nix";
  programs = {
    alejandra.enable = true;
    black.enable = true;
    gofmt.enable = false;
    prettier.enable = true;
    rufo.enable = true;
    shellcheck.enable = false;
    shfmt.enable = false;
    stylua.enable = true;
  };
}
