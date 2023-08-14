{...}: {
  user.name = "nixos";
  hm = {imports = [./home-manager/tarcisio.nix];};
  services.vscode-server.enable = true;
}
