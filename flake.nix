{
  description = "geta system flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-25.05";
    };
    
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:Sly-Harvey/nixvim";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixcord = {
      url = "github:kaylorben/nixcord";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixvim,
      spicetify-nix,
      nixcord,
      aagl,
      ...
      }@inputs:
    let
      myUserName = "nate";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;

      overlays = {
      nixpkgs.overlays = with inputs; [
        assets.overlays.default
        (import ./pkgs)
      ];
    };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit inputs;
          };
          modules = with inputs; [
            ./nixos/configuration.nix
            spicetify-nix.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        nate = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = { 
            inherit myUserName system inputs;
          };
          modules = with inputs; [ 
            ./home/home.nix
            nixcord.homeModules.nixcord
          ];
        };
      };
    };
}
