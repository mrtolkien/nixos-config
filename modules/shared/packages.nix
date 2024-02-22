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

  # Node.js development tools
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  deno

  go
  rustup
  pipx

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
  cloc

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
