{pkgs, ...}: {
  home.packages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
  ];
}
