{ pkgs }:

with pkgs; [
  # General packages for development and system management
  coreutils
  killall
  neofetch
  openssh
  sqlite
  wget
  zip
  unrar
  unzip
  helix

  # Cloud-related tools and SDKs
  # act
  docker
  docker-compose
  awscli2
  gh
  git-open

  # Development tools
  nil
  nixpkgs-fmt
  jetbrains-mono
  poetry
  postgresql
  # supabase-cli
  cargo-lambda
  pre-commit
  dbmate
  # tuna
  go
  rustup
  # llvm
  # gcc
  # clang
  # mold # TODO Didn't find a way to make that work
  cmake # C++ build system
  pandoc
  # vcpkg # C++ package manager 

  # Javascript and Typescript
  nodePackages.nodemon
  # nodePackages.prettier
  nodePackages.npm # globally install npm
  nodePackages.pnpm # globally install npm
  nodejs
  bun
  deno
  yarn

  # Text and terminal utilities
  bacon
  alacritty-theme
  # iftop
  bottom
  fd
  jq
  yq
  ripgrep
  bat
  less
  tealdeer
  lazygit
  chezmoi
  scc
  hugo

  # texliveMedium
  # texlivePackages.moderncv
  # texliveMedium.withPackages
  # (ps: [ ps.moderncv ])
  yazi

  # AI
  ollama

  # Encryption and security tools
  age

  # age-plugin-yubikey
  # gnupg
  # libfido2
  # pinentry
  # yubikey-manager
]
