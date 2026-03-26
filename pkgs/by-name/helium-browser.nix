{
  stdenv,
  lib,
  fetchurl,
  autoPatchelfHook,
  makeWrapper,
  makeDesktopItem,
  copyDesktopItems,
  alsa-lib,
  atk,
  at-spi2-atk,
  at-spi2-core,
  cairo,
  cups,
  dbus,
  expat,
  fontconfig,
  freetype,
  glib,
  gtk3,
  libdrm,
  libxkbcommon,
  mesa,
  nspr,
  nss,
  pango,
  systemd,
  libx11,
  libxcomposite,
  libxdamage,
  libxext,
  libxfixes,
  libxrandr,
  libxcb,
  wayland,
  libGL,
}: let
  pname = "helium-browser";
  version = "0.10.7.1";
in
  stdenv.mkDerivation {
    inherit pname version;

    src = fetchurl {
      url = "https://github.com/imputnet/helium-linux/releases/download/${version}/helium-${version}-x86_64_linux.tar.xz";
      hash = "sha256-ZHziopdl8ClZQJUHXtIIb9ok/flZoixMdlLMKf5HUUo=";
    };

    nativeBuildInputs = [
      autoPatchelfHook
      makeWrapper
      copyDesktopItems
    ];

    buildInputs = [
      alsa-lib
      atk
      at-spi2-atk
      at-spi2-core
      cairo
      cups
      dbus
      expat
      fontconfig
      freetype
      glib
      gtk3
      libdrm
      libxkbcommon
      mesa
      nspr
      nss
      pango
      systemd
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxcb
      wayland
      libGL
    ];

    desktopItems = [
      (makeDesktopItem {
        name = "helium-browser";
        desktopName = "Helium Browser";
        exec = "helium-browser %U";
        terminal = false;
        categories = ["Network" "WebBrowser"];
        comment = "A floating browser window";
      })
    ];

    installPhase = ''
      runHook preInstall

      mkdir -p $out/opt/helium $out/bin
      cp -r * $out/opt/helium/

      rm -f $out/opt/helium/libqt*_shim.so

      ln -s $out/opt/helium/helium $out/bin/helium-browser

      runHook postInstall
    '';

    postFixup = ''
      wrapProgram $out/bin/helium-browser \
        --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [
        libGL
        wayland
        libx11
      ]}"
    '';

    meta = with lib; {
      description = "Helium Browser (tar.xz version)";
      homepage = "https://github.com/imputnet/helium-linux";
      platforms = ["x86_64-linux"];
    };
  }
