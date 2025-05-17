{
  pkgs,
  config,
  inputs,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  imports = [
    inputs.sops-nix.nixosModules.sops
  ];
  users.users.scott = {
    isNormalUser = true;
    description = "Scott Fleener";
    shell = pkgs.fish;
    extraGroups = ["networkmanager" "wheel" "docker" "podman"] ++ ifTheyExist ["libvirtd" "mysql" "network" "git"];
    packages = [pkgs.home-manager];
  };

  # Import this user's personal/home configurations
  home-manager.users.scott = import ../../../../home/${config.networking.hostName}.nix;
}
