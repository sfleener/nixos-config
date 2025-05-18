{pkgs, ...}: {
  imports = [
    ./syncthing.nix
  ];

  home.packages = with pkgs; [
    age
    # gitkraken
    # pandoc
    sops
  ];
}
