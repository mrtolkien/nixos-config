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


  # Cloud-related tools and SDKs
  act
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
  sqls # sql language server
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  bun
  deno
  yarn
  supabase-cli
  cargo-lambda

  go

  rustup
  # llvm
  # gcc
  cmake # C++ build system
  vcpkg # C++ package manager 

  # clang
  # mold # TODO Didn't find a way to make that work

  pipx

  # Text and terminal utilities
  bacon
  alacritty-theme
  iftop
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

  # File managers (still testing)
  joshuto
  ranger
  yazi
  xplr
  nnn

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
