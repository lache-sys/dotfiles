{
  description = "Home Manager configuration of Lachesys";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    brew-nix = {
      url = "github:BatteredBunny/brew-nix";
      inputs = {
        brew-api = {
          follows = "brew-api";
        };
      };
    };
    brew-api = {
      url = "github:BatteredBunny/brew-api";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    mpv-src = {
      url = "github:mpv-player/mpv";
      flake = false;
    };
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      flake = false;
    };
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      brew-nix,
      nixgl,
      ...
    }@inputs:
    let
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";
      version = builtins.substring 0 8 lastModifiedDate;
    in
    {
      darwinConfigurations = {
        "0707" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./nix-darwin/defaults.nix
            ./nix-darwin/homebrew.nix
            ./nix-darwin/homebrew_sub.nix
          ];
        };
        Verdandi = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./nix-darwin/defaults.nix
            ./nix-darwin/homebrew.nix
            ./nix-darwin/homebrew_main.nix
          ];
        };
      };
      homeConfigurations = {
        "lache-sys@0707.local" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home/home.nix
            ./home/home_sub.nix
            ./programs/alacritty.nix
            ./programs/bash.nix
            ./programs/btop.nix
            ./programs/git.nix
            ./programs/mpv.nix
            ./programs/ranger.nix
            ./programs/rclone.nix
            ./programs/ssh.nix
            ./programs/starship.nix
            ./programs/texlive.nix
            ./programs/tmux.nix
            ./programs/tmuxinator.nix
            ./programs/vim.nix
            ./programs/zsh.nix
            ./services/gpg-agent.nix
            ./xdg/bettercmdtab.nix
            ./xdg/btop.nix
            ./xdg/clamav.nix
            ./xdg/myrc.nix
            ./xdg/ranger.nix
            ./xdg/vimt.nix
          ];
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
        "lache-sys@Verdandi.local" = home-manager.lib.homeManagerConfiguration {
          extraSpecialArgs = { inherit inputs; };
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [
            ./home/home.nix
            ./home/home_main.nix
            ./programs/alacritty.nix
            ./programs/bash.nix
            ./programs/btop.nix
            ./programs/cargo.nix
            ./programs/git.nix
            ./programs/mpv.nix
            ./programs/npm.nix
            ./programs/ranger.nix
            ./programs/rclone.nix
            ./programs/ssh.nix
            ./programs/starship.nix
            ./programs/texlive.nix
            ./programs/tmux.nix
            ./programs/tmuxinator.nix
            ./programs/vim.nix
            ./programs/zsh.nix
            ./services/gpg-agent.nix
            ./xdg/bettercmdtab.nix
            ./xdg/btop.nix
            ./xdg/clamav.nix
            ./xdg/myrc.nix
            ./xdg/ranger.nix
            ./xdg/vimt.nix
          ];
          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
      };
    };
}
