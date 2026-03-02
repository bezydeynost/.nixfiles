{pkgs, ...}: {
  home.packages = with pkgs; [
    ## Some apps
    materialgram
    ayugram-desktop

    ## CLI pkgs
    gh
    nix-melt
    microfetch
    speedtest-go
    bitwarden-cli
    nur.repos.zerozawa.mikusays

    ## Dev
    go
    python313
  ];
}
