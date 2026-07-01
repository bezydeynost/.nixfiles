{pkgs, ...}: {
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
  };
}
