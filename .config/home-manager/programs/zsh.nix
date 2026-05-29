{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    initContent = ''
      eval $(/opt/homebrew/bin/brew shellenv)
    '';
    shellAliases = {
      cat = "bat --paging=never";
      clamddl = "clamdscan ~/Downloads -i -m --remove";
      ls = "eza --icons --group-directories-first";
      nixall = "cd ~/.config/home-manager && nix flake update && home-manager switch --flake ~/.config/home-manager && sudo nix run nix-darwin -- switch --flake .#lache-sys-darwin";
      sza = "7zz a -mmt=on -mx=9 -sdel";
    };
    syntaxHighlighting = {
      enable = true;
    };
  };
}
