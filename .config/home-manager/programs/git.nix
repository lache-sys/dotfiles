{
  config,
  pkgs,
  ...
}:

{
  programs = {
    git = {
      enable = true;
      ignores = [
        "**/__pycache__/**"
        "**/.DS_Store"
        "**/.env"
        "**/*.log"
        "**/Thumbs.db"
      ];
      settings = {
        commit = {
          gpgsign = true;
        };
        include = {
          path = "${config.home.homeDirectory}/.gitconfig_personal";
        };
        http = {
          postBuffer = 524288000;
        };
        init = {
          defaultBranch = "main";
        };
        pull = {
          ffonly = true;
        };
        tag = {
          gpgsign = true;
        };
      };
    };
  };
}
