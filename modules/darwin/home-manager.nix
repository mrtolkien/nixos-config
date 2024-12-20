{ config, pkgs, lib, home-manager, ... }:

let
  user = "tolki";
  sharedFiles = import ../shared/files.nix { inherit config pkgs; };
  additionalFiles = import ./files.nix { inherit user config pkgs; };
in
{
  imports = [
    ./dock
  ];


  # It me
  users.users.${user} = {
    name = "${user}";
    home = "/Users/${user}";
    isHidden = false;
    shell = pkgs.zsh;
  };

  # homebrew = {
  #   enable = true;
  #   casks = pkgs.callPackage ./casks.nix { };
  # taps = [ "pulumi/tap" ];
  # brews = [
  #   "pulumi"
  # ];
  # {
  #   name = "rconroy293/seventeenlands/seventeenlands";
  #   restart_service = true;
  # }
  # ];

  # These app IDs are from using the mas CLI app
  # mas = mac app store
  # https://github.com/mas-cli/mas
  #
  # $ nix shell nixpkgs#mas
  # $ mas search <app name>
  #
  #   masApps = {
  #     "wireguard" = 1451685025;
  #     "line" = 539883307;
  #   };
  # };

  # Enable home-manager
  home-manager = {
    useGlobalPkgs = true;
    users.${user} = { pkgs, config, lib, ... }: {
      home = {
        enableNixpkgsReleaseCheck = false;
        packages = pkgs.callPackage ./packages.nix { };
        file = lib.mkMerge [
          sharedFiles
          additionalFiles
        ];

        stateVersion = "23.11";
      };
      programs = { } // import ../shared/home-manager.nix { inherit config pkgs lib; };

      # Marked broken Oct 20, 2022 check later to remove this
      # https://github.com/nix-community/home-manager/issues/3344
      manual.manpages.enable = false;
    };
  };

  # Fully declarative dock using the latest from Nix Store
  local.dock.enable = true;
  local.dock.entries = [
    { path = "/Applications/Firefox.app/"; }
    { path = "/Applications/Obsidian.app/"; }
    # { path = "/Applications/Cron.app/"; }
    { path = "/Applications/Slack.app/"; }
    # { path = "/Applications/Beeper.app/"; }
    { path = "/Applications/Signal.app/"; }
    { path = "/Applications/Visual Studio Code.app/"; }
    # { path = "/Applications/Alacritty.app/"; }
  ];

}
