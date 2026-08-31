{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      completionInit = "autoload -U compinit && compinit";
      enable = true;
      enableCompletion = true;
      initContent = ''
        source ~/.config/myrc/myrc
      '';
      profileExtra = ''
        source ~/.config/myrc/myprofile
      '';
      shellAliases = {
        brewall = "brew upgrade -y && brew upgrade --cask -g -y && brew doctor";
        cat = "bat --paging=never";
        clamd = "clamd_main";
        clamddl = "clamddl_main";
        clamdf = "clamdf_main";
        codebergall = "codebergall_main";
        cut4dl = "cut4dl_main";
        d2u = "dos2unix";
        emg = "emg_main";
        emgc = "emgc_main";
        emgl = "emgl_main";
        freshclam = "freshclam_main";
        gaa = "git add -A";
        gpa = "gpa_main";
        img2webp = "img2webp_main";
        less = "bat";
        ls = "eza --icons --group-directories-first";
        lsg = "lsg_main";
        nixall = "nixall_main";
        nixupg = "nixupg_main";
        openanyway = "openanyway_main";
        openurls = "openurls_main";
        pdf2png350 = "pdf2png350_main";
        png2webp = "img2webp_main .png";
        relogin = "relogin_main";
        roscheck = "roscheck_main";
        rpds = "rpds_main";
        safarisave = "safarisave_main";
        smart = "smartctl -a";
        ssddir = "ssddir_main";
        sza = "7zz a -mmt=on -mx=9 -sdel";
        vvim = "vim -u NONE -N";
        wav2flac = "wav2flac_main";
      };
      syntaxHighlighting = {
        enable = true;
      };
    };
  };
}
