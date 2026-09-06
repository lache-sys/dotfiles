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
        function _pdf2png350_main () {
          _filedir pdf
        }
        function _urlfromtsv_main () {
          _filedir tsv
        }
        function _urlfromtxt_main () {
          _filedir txt
        }
        complete -F _clamdf_main clamdf_main
        complete -F _cut4dl_main cut4dl_main
        complete -F _lsg_main lsg_main
        complete -F _openanyway_main openanyway_main
        complete -F _urlfromtsv_main urlfromtsv_main
        complete -F _urlfromtxt_main urlfromtxt_main
        complete -F _pdf2png350_main pdf2png350_main
      '';
    };
  };
}
