{
  pkgs,
  config,
  ...
}: {
  programs.bash.enable = true;

  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "history-substring-search"
        "sudo"
        "vi-mode"
        "fzf"
      ];
    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
    ];

    initContent = ''
      autoload -Uz colors && colors
      setopt PROMPT_SUBST
      typeset -gi timer elapsed

      git_prompt_info() {
        local branch dirty ahead behind

        branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

        if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
          dirty="*"
        fi

        local git_status
        git_status=$(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null)

        if [[ -n "$git_status" ]]; then
          behind=$(echo $git_status | awk '{print $1}')
          ahead=$(echo $git_status | awk '{print $2}')
        fi

        if [[ -z "$behind" ]]; then
          behind=0
        fi

        if [[ -z "$ahead" ]]; then
          ahead=0
        fi

        local arrows=""
        [[ "$behind" != "0" ]] && arrows+="⇣"
        [[ "$ahead" != "0" ]] && arrows+="⇡"

        echo " %F{cyan}''${branch}''${dirty} ''${arrows}%f"
      }

      python_prompt_info() {
        [[ -n "$VIRTUAL_ENV" ]] && echo "($(basename "$VIRTUAL_ENV")) "
      }

      preexec() {
        timer=$SECONDS
      }

      precmd() {
        if [[ -n "$timer" ]]; then
          elapsed=$(( SECONDS - timer ))
          unset timer
        fi
      }

      execution_time_prompt() {
        if [[ ''${elapsed:-0} -ge 5 ]]; then
          echo "%F{yellow}''${elapsed}s%f"
        fi
      }

      # ri8ht prompt
      RPROMPT='$(execution_time_prompt)'

      PROMPT='$(python_prompt_info)%F{blue}%~%f$(git_prompt_info)

      %(?.%F{magenta}❯%f.%F{red}❯%f) '

      if [[ -o interactive ]] && [[ -z "''${FASTFETCH_RAN:-}" ]]; then
        FASTFETCH_RAN=1
        if [[ -f "${config.home.homeDirectory}/.config/fastfetch/config.jsonc" ]]; then
          fastfetch
        fi
      fi

      source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
      typeset -g ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'
      typeset -g ZSH_AUTOSUGGEST_STRATEGY=(history completion)
      bindkey '^ ' autosuggest-accept
      bindkey -M viins '^F' autosuggest-accept
    '';
  };
}
