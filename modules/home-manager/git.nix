{ config, lib, pkgs, ... }: {
  home.packages = [ pkgs.github-cli pkgs.git-crypt ];
  programs.git = {
    userName = "Tarcísio Genaro Rodrigues";
    extraConfig = {
      credential.helper =
        if pkgs.stdenvNoCC.isDarwin then
          "osxkeychain"
        else
          "cache --timeout=1000000000";
      fetch.prune = true;
      http.sslVerify = true;
      init.defaultBranch = "main";
    };
    aliases = {
      st = "status -s";
      br = "branch -a";
      ll = "log --graph --pretty=format:'%C(yellow)%h\\ %ad%Cred%d\\ %Creset%+s%Cblue\\ [%cn]' --decorate --numstat --date=short";
      fix = "commit --amend --no-edit";
      oops = "reset HEAD~1";
      sub = "submodule update --init --recursive";
    };
    delta = {
      enable = true;
      options = {
        side-by-side = true;
        line-numbers = true;
      };
    };
    lfs.enable = true;
  };
}
