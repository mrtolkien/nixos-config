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
  bacon
  pipx
  cmake
  vcpkg

  # Text and terminal utilities
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
