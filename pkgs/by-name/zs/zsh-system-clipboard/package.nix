{
  stdenv,
  lib,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "zsh-system-clipboard";
  version = "0.8.0";

  src = fetchFromGitHub {
    owner = "kutsan";
    repo = "zsh-system-clipboard";
    rev = "v${version}";
    hash = "sha256-VWTEJGudlQlNwLOUfpo0fvh0MyA2DqV+aieNPx/WzSI=";
  };

  strictDeps = true;
  installPhase = ''
    install -D zsh-system-clipboard.zsh $out/share/zsh/${pname}/zsh-system-clipboard.zsh
  '';

  meta = with lib; {
    homepage = "https://github.com/kutsan/zsh-system-clipboard";
    description = "Plugin that adds key bindings support for ZLE (Zsh Line Editor) clipboard operations for vi emulation keymaps";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [
      _0qq
      satoqz
    ];
    platforms = platforms.all;
  };
}
