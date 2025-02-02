{ stdenv
, lib
, fetchFromGitHub
, vala
, meson
, ninja
, wrapGAppsHook4
, libadwaita
, libxml2
, desktop-file-utils
, pkg-config
, libportal-gtk4
, blueprint-compiler
}:

stdenv.mkDerivation rec {
  pname = "flowtime";
  version = "6.1";

  src = fetchFromGitHub {
    owner = "Diego-Ivan";
    repo = "Flowtime";
    rev = "v${version}";
    hash = "sha256-wTqHTkt1O3Da2fzxf6DiQjrqOt65ZEhLOkGK5C6HzIk=";
  };

  nativeBuildInputs = [
    blueprint-compiler
    desktop-file-utils
    meson
    ninja
    pkg-config
    vala
    wrapGAppsHook4
  ];

  buildInputs = [
    libadwaita
    libxml2
    libportal-gtk4
  ];

  meta = with lib; {
    description = "Get what motivates you done, without losing concentration";
    homepage = "https://github.com/Diego-Ivan/Flowtime";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ foo-dogsquared pokon548 ];
    platforms = platforms.linux;
  };
}
