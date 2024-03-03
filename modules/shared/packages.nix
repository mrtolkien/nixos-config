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

  # Development tools
  nil
  nixpkgs-fmt
  jetbrains-mono
  poetry
  postgresql

  # Cloud-related tools and SDKs
  act
  docker
  docker-compose
  awscli2
  gh
  git-open

  # Development tools
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  bun
  deno
  yarn
  supabase-cli

  go
  rustup
  pipx
  cmake

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
