{
  config,
  lib,
  pkgs,
  ...
}: {
  user.name = "silvia";
  hm = {imports = [./home-manager/silvia.nix];};
}
