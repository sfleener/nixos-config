{pkgs, ...}: {
  imports = [
    ./services.nix
    ./swaylock.nix
    ./xwayland-satellite.nix
  ];

  home.packages = with pkgs; [
    swww
    swaynotificationcenter
    wl-clipboard
    cliphist
    wl-clip-persist
    wlogout
    libinput
    networkmanagerapplet
    pavucontrol
    playerctl
    pipewire
    hyprpicker
  ];

  home.file.".config/niri" = {
    recursive = true;
    source = ./niri;
  };

  home.file.".config/swaync" = {
    recursive = true;
    source = ./swaync;
  };

  home.sessionVariables.NIXOS_OZONE_WL = "1";
}
