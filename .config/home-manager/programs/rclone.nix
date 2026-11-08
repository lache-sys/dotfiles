{
  config,
  pkgs,
  ...
}:

{
  programs = {
    rclone = {
      enable = true;
      remotes = {
        TrueNAS = {
          config = {
            host = "truenas.local";
            key_user_agent = true;
            known_hosts_file = "${config.home.homeDirectory}/.ssh/known_hosts";
            type = "sftp";
            user = "admin";
          };
        };
      };
    };
  };
}
