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

      export EDITOR="nvim"
      export VISUAL="nvim"

      # nix shortcuts
      shell() {
          nix-shell '<nixpkgs>' -A "$1"
      }

      # Use difftastic, syntax-aware diffing
      alias diff=difft

      # My usual aliases
      alias dps="docker ps"
      alias f="open ."
      alias ls="lsd"
      alias ll="lsd -l"
      alias la="lsd -la"
      alias lt="lsd --tree --depth"

      # TODO Exa and stuff
      # fzf
      # TODO Do that
      # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

      # Zoxide = z replacement!
      eval "$(zoxide init zsh)"

      # Atuin shell history
      eval "$(atuin init zsh)"

      # Starship prompt
      eval "$(starship init zsh)"
      
      # TODO Local stuff that needs to be optional
      eval "$(/Users/tolki/.local/share/rtx/bin/rtx activate zsh)"
      export PATH="$PATH:/Users/tolki/Development/flutter/flutter/bin"
      # TODO Review direnv
      # eval "$(direnv hook zsh)"
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

  # TODO Use chadnvim
  alacritty = {
    enable = true;
    settings = {
      cursor = {
        style = "Block";
        working_directory = "Development";
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
      };

      dynamic_padding = true;

      # TODO Add hints
      # TODO Add keybindings
    };
  };

  # TODO Add
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
