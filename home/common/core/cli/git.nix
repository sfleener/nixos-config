{ lib, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userEmail = "me@scottfleener.com";
    userName = "Scott Fleener";
    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
      gpg = {format = "ssh";};
      commit.gpgSign = true;
      merge.conflictStyle = "zdiff3";
      branch.sort = "committerdate";
      push.autoSetupRemote = true;
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPjGSaQwuTsH1/BvZh0TjY2I0jm9SwjHWZLUoHxidS7X";
      signer = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
    };
    lfs.enable = true;
    ignores = [
      ".direnv/"
      ".devenv/"
      ".venv/"
      ".env"
      ".idea/"
      "*.iml"
    ];
  };
}
