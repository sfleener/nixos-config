{pkgs, ...}: {
  imports = [
    ./ssh.nix
    ./gpg.nix
    ./spicetify.nix
  ];
  home.packages = with pkgs; [
    proton-pass
    protonvpn-gui
    protonvpn-cli
    appimage-run
    brightnessctl
    # capacities-latest
    clickup-latest
    code-cursor
    eog
    firefox
    gparted
    heptabase
    libgcc
    libreoffice-fresh
    libsForQt5.okular
    lshw
    morgen-latest
    nautilus
    obsidian
    pdfarranger
    psmisc
    seahorse
    signal-desktop
    tana
    udisks
    zotero
    firefox
    zoom-us
  ];
}
