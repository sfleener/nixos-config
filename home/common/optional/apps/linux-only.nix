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
    kdePackages.wacomtablet
    libgcc
    libreoffice-fresh
    libsForQt5.okular
    libwacom
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
