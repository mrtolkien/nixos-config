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

  # Cloud-related tools and SDKs
  act
  docker
  docker-compose
  awscli2
  gh

  # Node.js development tools
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  deno

  go

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
