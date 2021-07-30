let
  pkgs = import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    rev = "ca5d520a0fa87e80c871a105d21dff3e9af3e57d";
  }) {};
in
(import ./default.nix {
  inherit pkgs;
}).package.override {
  prePatch = ''
    export NG_CLI_ANALYTICS=false
    export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
  '';
}
