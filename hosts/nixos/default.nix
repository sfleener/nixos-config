{
  pkgs,
  outputs,
  inputs,
  ...
}: {
  imports =
    [
      # Hardware config
      inputs.hardware.nixosModules.common-cpu-amd
      inputs.hardware.nixosModules.common-gpu-amd
      ./hardware-configuration.nix

      # Common config
      ../common/core

      # Optional configs
      # ../common/optional/hyprland.nix
      ../common/optional/niri.nix
      ../common/optional/1password.nix

      # User config
      ../common/users/scott
    ]
    ++ (builtins.attrValues outputs.nixosModules);

  # Bootloader.
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.configurationLimit = 15;
  boot.loader.systemd-boot.configurationLimit = 15;
  boot.supportedFilesystems = ["ntfs" "ext4"];

  # amd gpu support for kernel
  boot.initrd.kernelModules = ["amdgpu"];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [
      rocmPackages.clr
      rocmPackages.clr.icd
    ];
  };

  # Load amd driver for Xorg and Wayland
  services.xserver.videoDrivers = ["amdgpu"];

  hardware.bluetooth.enable = true;

  console.useXkbConfig = true;

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.variant = "";
    displayManager.gdm.enable = true;
  };

  system.stateVersion = "24.11";
}
