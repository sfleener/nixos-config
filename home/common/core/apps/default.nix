{pkgs, ...}: {
  imports = [
    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    age
    sops
    tailscale
  ];
}
