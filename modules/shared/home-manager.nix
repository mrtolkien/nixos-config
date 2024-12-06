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
    autocd = true;

    autosuggestion = { enable = true; };
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
      export PATH=$HOME/.local/bin:$PATH
      # export PATH=$HOME/.cargo/bin:$PATH
      export PATH=/opt/homebrew/bin/:$PATH
      export PATH="$HOME/.bun:$PATH"

      # Remove history data we don't want to see
      export HISTIGNORE="pwd:ls:cd"
      export VCPKG_ROOT="$HOME/Development/vcpkg"
    '';

    initExtra = ''
      # Aliases
      alias dps="docker ps"
      alias diff=difft
      alias f="marta ."
      alias v="y '/Users/tolki/Library/Mobile Documents/iCloud~md~obsidian/Documents/Vaulki'"
      alias l=lazygit

      # zsh-vi-mode + atuin + rye
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      zvm_after_init_commands+=(eval "$(atuin init zsh)")
      source "$HOME/.rye/env"
      source "$HOME/.cargo/env"
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


  atuin = {
    enable = true;
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

  tealdeer = {
    enable = true;
    settings.display.compact = true;
  };

  # thefuck = {
  #   enable = true;
  #   enableZshIntegration = true;
  # };

  zellij = {
    enable = true;
  };

  zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  starship = {
    enable = true;
    enableZshIntegration = true;
  };

  yazi = {
    enable = true;
    enableZshIntegration = true;
    shellWrapperName = "y";

    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };

    # initLua = ''
    #   			require("full-border"):setup()
    #   			require("starship"):setup()
    #   		'';
  };

}
