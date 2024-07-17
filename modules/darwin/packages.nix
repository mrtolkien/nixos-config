{ pkgs }:

with pkgs;
let shared-packages = import ../shared/packages.nix { inherit pkgs; }; in
shared-packages ++ [
  # dockutil
  alt-tab-macos
  grandperspective
  keka
  karabiner-elements
  appcleaner
]
