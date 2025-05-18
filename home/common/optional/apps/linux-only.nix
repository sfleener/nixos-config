{pkgs, ...}: {
  imports = [
    ./ssh.nix
    ./spicetify.nix
  ];
  home.packages = with pkgs; [
    brightnessctl
    eog
    firefox
    gparted
    libgcc
    libreoffice-fresh
    libsForQt5.okular
    lshw
    morgen-latest
    nautilus
    obsidian
    tailscale
    psmisc
    udisks
  ];
}
