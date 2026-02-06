{
  description = "myflake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak = {
    url = "github:gmodena/nix-flatpak/?ref=latest";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    awww = {
    url = "git+https://codeberg.org/LGFae/awww";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
    url = "github:kaylorben/nixcord";
    inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
    url = "github:Gerg-L/spicetify-nix";
    inputs.nixpkgs.follows = "nixpkgs";
    };

    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    }; 
  };

  outputs = inputs@{
    nixpkgs,
    self,
    home-manager,
    nur,
    nix-flatpak,
    stylix,
    antigravity-nix,
    ...
  }:
  let
    system = "x86_64-linux";
    config = {
      allowUnfree = true;
      rocmSupport = true;
    };
    pkgs = import nixpkgs {
      inherit system;
      inherit config;
    };
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = {
        inherit inputs system;
      };

      modules = [
        ./nixos/configuration.nix
        nur.modules.nixos.default
        nix-flatpak.nixosModules.nix-flatpak
        stylix.nixosModules.stylix	
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            backupFileExtension = "backup";

            users.falguren = import ./home/home.nix;
	    sharedModules = [
	    inputs.nixcord.homeModules.nixcord
	    ];

	    extraSpecialArgs = {
	    inherit inputs;
            };
          };
        }
      ];
    };
  };
}
