{
  config,
  outputs,
  ...
}: {
  imports =
    [
      ./common/core
      ./common/optional/apps/wezterm/config.nix
      ./common/optional/apps/kitty/config.nix
      ./common/optional/apps/ghostty/config.nix
      # NOTE: espanso disabled because it's not working on wayland
      # ./common/optional/misc/espanso.nix
    ]
    ++ (builtins.attrValues outputs.homeManagerModules);

  home = {
    username = "g8k";
    homeDirectory = "/Users/${config.home.username}";
    stateVersion = "24.11";
  };
}
