#
# This is a basic enablement of fish at the host level as a safe guard
#
{pkgs, ...}: {
  programs.fish = {
    enable = true;
    enableCompletion = true;
  };
  users.defaultUserShell = pkgs.fish;
  environment.shells = with pkgs; [fish];
}
