{ config, pkgs, ... }:

{
  xdg = {
    configFile = {
      "vim/template/t.bash" = {
        text = ''
          #!usr/bin/env bash
          set -euo pipefail && :<<'USAGE'
          Usage: $(basename "$0") [-h | --help] [NAME]

          Options:
            -h | --help Display this help
          USAGE
          function init () {
            readonly local _fn="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")" .bash)"
            readonly local _scr_dir="$(realpath "$(dirname "$0")")"
            cd "''${_scr_dir}"
            return 0
          }
          function usage () {
            while IFS= read -r line && [ ! "''${line#*:}" = "<<'$1'" ]; do :; done
            while IFS= read -r line && [ ! "$line" = "$1" ]; do set "$@" "$line"; done
            shift && [ $# -eq 0 ] || printf '%s\n' "cat<<$line" "$@" "$line"
          }
          case ''${1:-} in (-h | --help)
            eval "$(usage "USAGE" < "$0")"
            exit 0
          esac
          function main () {
            init
            return 0
          }
          main "$@"
          exit 0
        '';
      };
      "vim/template/t.cmd" = {
        text = ''
          @echo off && setlocal
          chcp 65001
          pushd %0\..
          endlocal
          exit /b
        '';
      };
      "vim/template/t.html" = {
        text = ''
          <!DOCTYPE html>
          <html lang="ja"
          <head>
          <meta charset="utf-8">
          <link rel="stylesheet" href="style.css"
          type="text/css" charset="utf-8">
          <title>
          </title>
          </head>
          <body>
          </body>
          </html>
        '';
      };
      "vim/template/t.m3u" = {
        text = ''
          #EXTM3U
          #PLAYLIST:
        '';
      };
      "vim/template/t.md" = {
        text = ''
          ---
          author:
            - name:
              affiliation:
          created:
          lang: ja-JP
          keywords:
            -
          tags:
            -
          title:
          ---

          # Title  

          <!-- toc -->  
        '';
      };
      "vim/template/t.py" = {
        text = ''
          #!/usr/bin/env python3
          # -*- coding: utf-8 -*-

          import argparse
          import logging
          import os
          import sys


          def main():
            init()
            sys.exit()


          def init():
            os.chdir(os.path.dirname(os.path.abspath(__file__)))
            return


          def logger_settings():
            fn = os.path.splitext(os.path.basename(sys.argv[0]))[0]
            handler = logging.StreamHandler()
            logging.basicConfig(
              level = logging.DEBUG,
              format = '%(asctime)s [%(levelname)s] %(message)s',
              datefmt = '%Y-%m-%d %H:%M:%S',
              handlers = [
                logging.FileHandler(filename=fn+'.log'),
              ]
            )
            logger = logging.getLogger(__name__)
            return logger

          if __name__ == "__main__":
            parser = argparse.ArgumentParser(description='.') 
            parser.add_argument('-i', '--input', help='Input. (required)',
                                required=True)
            args = parser.parse_args()
            main(args.input)
        '';
      };
      "vim/template/t.zsh" = {
        text = ''
          #!/usr/bin/env zsh
        '';
      };
    };
  };
}
