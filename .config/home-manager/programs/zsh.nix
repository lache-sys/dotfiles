{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      function nixall_main () {
        cd ~/.config/home-manager
        nix flake update
        home-manager switch --flake .
        sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin
        return 0
      }
      eval $(/opt/homebrew/bin/brew shellenv)
      if [[ $SHLVL = 1 ]]; then
        tmux
      fi
    '';
    shellAliases = {
      cat = "bat --paging=never";
      clamddl = "clamdscan ~/Downloads -i -m --remove";
      ls = "eza --icons --group-directories-first";
      nixall = "nixall_main";
      smart = "smartctl -a";
      sza = "7zz a -mmt=on -mx=9 -sdel";
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
}
