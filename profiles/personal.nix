{ config, lib, pkgs, ... }: {
  user.name = "tarc";
  hm = { imports = [ ./home-manager/personal.nix ]; };
}
