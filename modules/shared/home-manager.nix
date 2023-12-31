{ config, pkgs, lib, ... }:

let
  name = "mrtolkien";
  user = "tolki";
  email = "gary.mialaret@gmail.com";
in
{
  # Shared shell configuration
  zsh = {
    enable = true;
    autocd = false;

    enableAutosuggestions = true;
    enableCompletion = true;

    syntaxHighlighting = {
      enable = true;
    };

    initExtraFirst = ''
      if [[ -f /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]]; then
        . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
        . /nix/var/nix/profiles/default/etc/profile.d/nix.sh
      fi

      # Define variables for directories
      export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
      export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
      export PATH=$HOME/.local/share/bin:$PATH

      # Remove history data we don't want to see
      export HISTIGNORE="pwd:ls:cd"

      # Aliases
      alias dps="docker ps"
      alias f="open ."
      alias diff=difft

      # zsh-vi-mode + atuin
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      zvm_after_init_commands+=(eval "$(atuin init zsh)")
    '';
  };


  git = {
    enable = true;
    ignores = [ "*.swp" ];
    userName = "mrtolkien";
    userEmail = email;
    lfs = {
      enable = true;
    };
    difftastic = {
      enable = true;
    };
    extraConfig = {
      init.defaultBranch = "main";
      core = {
        editor = "nvim";
        autocrlf = "input";
      };
      pull.rebase = true;
      rebase.autoStash = true;
    };
  };


  alacritty = {
    enable = true;
    settings = {
      working_directory = "Development";

      cursor = {
        style = "Block";
      };

      font = {
        normal = {
          family = "JetBrainsMono Nerd Font";
          style = "Regular";
        };
        size = lib.mkMerge [
          (lib.mkIf pkgs.stdenv.hostPlatform.isLinux 10)
          (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin 14)
        ];
      };

      window = {
        decorations = "buttonless";
        opacity = 1.0;
        padding = {
          x = 10;
          y = 10;
        };
        option_as_alt = "Both";
      };

      dynamic_padding = true;
    };
  };

  atuin = {
    enable = true;

    settings = {
      inline_height = 20;
      dialect = "uk";
    };
  };

  neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  lsd = {
    enable = true;
    enableAliases = true;
  };


  direnv = {
    enable = true;
    enableZshIntegration = true;
  };

  rtx = {
    enable = true;
    enableZshIntegration = true;
  };

  thefuck = {
    enable = true;
    enableZshIntegration = true;
  };

  zellij = {
    enable = true;
    enableZshIntegration = true;
  };

  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      format = "$os$all";

      os = {
        disabled = false;
        symbols = {
          Unknown = " ";
          Macos = " ";
          Fedora = " ";
          NixOS = " ";
          Debian = " ";
          Amazon = " ";
          Raspbian = " ";
          Ubuntu = " ";
        };
      };

      character = {
        success_symbol = "➜";
        error_symbol = "➜";
      };

      aws = {
        style = "bold #FF9900";
        symbol = "󰸏 ";

        region_aliases = {
          ap-northeast-1 = "東京";
        };
      };

      python = {
        symbol = " ";
      };

      rust = {
        symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      directory = {
        read_only = " ";
      };

      conda = {
        symbol = " ";
      };

      package = {
        disabled = true;
      };

    };
  };

  # TODO Add ssh config
  # ssh = {
  #   enable = true;

  #   extraConfig = lib.mkMerge [
  #     ''
  #       Host github.com
  #         Hostname github.com
  #         IdentitiesOnly yes
  #     ''
  #     (lib.mkIf pkgs.stdenv.hostPlatform.isLinux
  #       ''
  #         IdentityFile /home/${user}/.ssh/id_github
  #       '')
  #     (lib.mkIf pkgs.stdenv.hostPlatform.isDarwin
  #       ''
  #         IdentityFile /Users/${user}/.ssh/id_github
  #       '')
  #   ];
  # };

}
