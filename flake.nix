{
  description = "A flake to handle multiple systems with a hierarchy";

  inputs = {
    # Fetch the latest nixpkgs from the master branch of the NixOS repository
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    # Fetch home-manager and make it follow nixpkgs
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Fetch nix-darwin and make it follow nixpkgs and home-manager
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";


    # Homebrew package manager support
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, nix-homebrew, homebrew-core, homebrew-cask, ... }: {

    # NixOS configurations for personal and work systems
    nixosConfigurations = {
      nixvm = nixpkgs.lib.nixosSystem {
        system = "arm64-linux";
        modules = [
          ./hosts/nixvm/configuration.nix
          ./hosts/nixvm/hardware-configuration.nix
          ./hosts/modules/programs.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bcr = import ./home/desktop-home.nix;
          }
        ];
      };
    };
    nixosConfigurations = {
      nixdesk = nixpkgs.lib.nixosSystem {
        system = "amd64-linux";
        modules = [
          ./hosts/nixdesk/configuration.nix
          ./hosts/nixdesk/hardware-configuration.nix
          ./hosts/modules/programs.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.bcr = import ./home/desktop-home.nix;
          }
        ];
      };
    };

    # Darwin (macOS) configurations 
    darwinConfigurations = {
      m4kode = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        pkgs = import nixpkgs {
          system = "aarch64-darwin";
          config.allowUnfree = true;
        };
        modules = [
          ./hosts/m4kode/configuration.nix
          { users.users."bcr".home = "/Users/bcr"; }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.backupFileExtension = "bak";
            home-manager.useUserPackages = true;
            home-manager.users."bcr" = {
              imports = [
                ./home/macos-home.nix
              ];
            };
          }
        ];
      };
    };

    # Home Manager configurations for Unix personal, Unix work, and WSL systems
    #homeConfigurations = {
    #  nixvm = home-manager.lib.homeManagerConfiguration {
    #    pkgs = nixpkgs.legacyPackages.arm64-linux;
    #    modules = [
    #      ./home/desktop-home.nix
    #      {
    #        home.username = "bcr";
    #        home.homeDirectory = "/home/bcr";
    #      }         
    #    ];
    #  };
    #};
  };
}
