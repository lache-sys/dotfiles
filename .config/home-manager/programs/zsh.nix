{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      completionInit = "autoload -U compinit && compinit";
      enable = true;
      enableCompletion = true;
      initContent = ''
        source ~/.config/myrc/myrc
        function _clamdf_main () {
          _files -g '*txt' -W ./
        }
        function _cut4dl_main () {
          _files -g '*csv' -W ./
        }
        function _lsg_main () {
          _files -W ./
        }
        function _openanyway_main () {
          _files -g '*app' -W ./
        }
        function _openurls_main () {
          _files -g '*txt' -W ./
        }
        function _pdf2png350_main () {
          _files -g '*pdf' -W ./
        }
        compdef clamdf_main _clamdf_main
        compdef cut4dl_main _cut4dl_main
        compdef lsg_main _lsg_main
        compdef openanyway_main _openanyway_main
        compdef openurls_main _openurls_main
        compdef pdf2png350_main _pdf2png350_main
      '';
      profileExtra = ''
        source ~/.config/myrc/myprofile
      '';
      shellAliases = {
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
