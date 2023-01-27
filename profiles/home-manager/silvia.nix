{
  config,
  lib,
  pkgs,
  ...
}: {
  programs.git = {
    userEmail = "tarcisio.genaro@gmail.com";
    userName = "Tarcísio Genaro Rodrigues";
    signing = {
      key = "tarcisio.genaro@gmail.com";
      signByDefault = false;
    };
  };
}
