{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        source ~/.config/myrc/myprofile
        source ~/.config/myrc/myrc
        function _clamdf_main () {
          _filedir txt
        }
        function _cut4dl_main () {
          _filedir csv
        }
        function _lsg_main () {
          _filedir -d
        }
        function _openanyway_main () {
          _filedir app
        }
        function _openurls_main () {
          _filedir txt
        }
        function _pdf2png350_main () {
          _filedir pdf
        }
        complete -F _clamdf_main clamdf_main
        complete -F _cut4dl_main cut4dl_main
        complete -F _lsg_main lsg_main
        complete -F _openanyway_main openanyway_main
        complete -F _openurls_main openurls_main
        complete -F _pdf2png350_main pdf2png350_main
      '';
    };
  };
}
