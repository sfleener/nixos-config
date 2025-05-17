{
  programs.git = {
    enable = true;
    userEmail = "me@scottfleener.com";
    userName = "Scott Fleener";
    extraConfig = {
      core.editor = "hx";
      init.defaultBranch = "main";
      user.signingkey = "~/.ssh/id_ed25519";
      gpg = {format = "ssh";};
      commit.gpgSign = true;
      merge.conflictStyle = "zdiff3";
      branch.sort = "committerdate";
      push.autoSetupRemote = true;
    };
    lfs.enable = true;
    ignores = [
      ".direnv/"
      ".devenv/"
      ".venv/"
      ".env"
    ];
  };
}
