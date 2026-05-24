{
  pkgs,
  lib,
  ...
}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkForce "Liberation Mono:size=13";
        font-bold = lib.mkForce "Liberation Mono:weight=bold:size=13";
        font-italic = lib.mkForce "Liberation Mono:slant=italic:size=13";
        font-bold-italic = lib.mkForce "Liberation Mono:weight=bold:slant=italic:size=13";
        pad = "5x5";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
