{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {
  programs = {
    tmux = {
      enable = true;
      extraConfig = builtins.readFile ./configs/tmux.conf;
      plugins = with pkgs.tmuxPlugins; [
        cpu
        vim-tmux-navigator
        power-theme
      ];
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      plugins = [
        {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        }
        {
          name = "powerlevel10k-config";
          src = ./configs;
          file = "p10k.zsh";
        }
      ];
      enable = true;
      defaultKeymap = "emacs";
      shellAliases = {
        rm = "rm -i";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      initExtra = ''
        # search history based on what's typed in the prompt
        autoload -U history-search-end
        zle -N history-beginning-search-backward-end history-search-end
        zle -N history-beginning-search-forward-end history-search-end
        bindkey "^[OA" history-beginning-search-backward-end
        bindkey "^[OB" history-beginning-search-forward-end

        # C-right / C-left for word skips
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word

        # C-Backspace / C-Delete for word deletions
        bindkey "^[[3;5~" forward-kill-word
        bindkey "^H" backward-kill-word

        # Home/End
        bindkey "^[[OH" beginning-of-line
        bindkey "^[[OF" end-of-line


        # case insensitive tab completion
        zstyle ':completion:*' completer _complete _ignored _approximate
        zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
        zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
        zstyle ':completion:*' menu select
        zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
        zstyle ':completion:*' verbose true

        # use cache for completions
        zstyle ':completion:*' use-cache on
        zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
        _comp_options+=(globdots)

        ${lib.optionalString config.services.gpg-agent.enable ''
          gnupg_path=$(ls $XDG_RUNTIME_DIR/gnupg)
          export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/$gnupg_path/S.gpg-agent.ssh"
        ''}
      '';
    };
  };
}
