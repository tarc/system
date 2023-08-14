# WSL NixOS system configurations

## Clean up

Form Windows:

```cmd
wsl -l -v
wsl --unregister NixOS
```

## Bootstrap

From Windows:

```cmd
wsl --update
wsl --import NixOS .\NixOS\ .\PATH\nixos-wsl-x86_64-linux.tar.gz --version 2
wsl -d NixOS
```

From NixOS:

```bash
cd
nix-shell -p git
git clone https://github.com/tarc/system
cd system/system-wsl/
sudo nixos-rebuild switch --show-trace --flake .
```

## Install home-manager

```bash
cd system
nix run .#sysdo bootstrap -- --allow-insecure
```

## Allow direnv

```bash
cd system
direnv allow
```

## Update

```bash
cd system/system-wsl/
sudo nix-channel --list
sudo nix-channel --add https://nixos.org/channels/nixos-23.05 nixos
sudo nix-channel --update
sudo nixos-rebuild switch --show-trace --flake .
```

## Check versions

```bash
nixos-wsl-version
nixos-version
```

## Push to cache

```bash
cachix use tarc
```

## References

- https://xeiaso.net/blog/nix-flakes-4-wsl-2022-05-01
- https://github.com/nix-community/NixOS-WSL
  - https://github.com/nix-community/NixOS-WSL/releases/tag/22.05-5c211b47
  - https://github.com/nix-community/NixOS-WSL/issues/269
  - https://github.com/nix-community/NixOS-WSL/issues/269#issuecomment-1654744764
