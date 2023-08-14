import ./module.nix ({
  name,
  description,
  serviceConfig,
}: {
  systemd.user.services.${name} = {
    Unit = {
      Description = description;
    };

    Service = serviceConfig;

    Install = {
      WantedBy = ["default.target"];
    };
  };
})
{pkgs, ...}: {
  imports = [./dconf.nix];

  gtk = {
    enable = true;

    iconTheme = {
      package = pkgs.yaru-theme;
      name = "Yaru";
    };

    theme = {
      package = pkgs.yaru-theme;
      name = "Yaru-dark";
    };

    gtk3.extraConfig = {
      gtk-icon-theme-name = "Yaru";
      gtk-theme-name = "Yaru-dark";
      gtk-application-prefer-dark-theme = 1;
    };
  };
  services.gnome-keyring.enable = true;
}
