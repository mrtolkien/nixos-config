{ pkgs }:

with pkgs; [
  # TODO Review
  # General packages for development and system management
  act
  alacritty
  bat
  btop
  coreutils
  killall
  neofetch
  openssh
  # pandoc
  sqlite
  wget
  zip

  # Encryption and security tools
  age
  age-plugin-yubikey
  gnupg
  libfido2
  pinentry
  yubikey-manager

  # Cloud-related tools and SDKs
  docker
  docker-compose

  awscli2
  # flyctl
  # ngrok
  # tflint

  # Media-related packages
  dejavu_fonts
  ffmpeg
  fd
  font-awesome
  hack-font
  noto-fonts
  noto-fonts-emoji
  meslo-lgs-nf

  # Node.js development tools
  nodePackages.nodemon
  nodePackages.prettier
  nodePackages.npm # globally install npm
  nodejs
  deno

  # Text and terminal utilities
  htop
  # hunspell
  iftop
  jetbrains-mono
  jq
  yq
  ripgrep
  # tree
  # tmux
  unrar
  unzip

  # Added by Gary
  zellij
  starship
  fzf
  fd
  gh
  tealdeer
  zoxide
  lsd
  nil
  atuin
  nixpkgs-fmt
  neovim
  erdtree

  # Python packages
  # TODO Review python management
  # python39
  # python39Packages.virtualenv # globally install virtualenv
]
