{
  description = "geta system flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    
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

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors = {
      url = "github:misterio77/nix-colors";
    };

    textfox = {
      url = "github:adriankarlen/textfox";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      nixvim,
      spicetify-nix,
      nixcord,
      aagl,
      textfox,
      ...
      }@inputs:
    let
      username = "nate";
      theme = "black-metal-burzum";
      system = "x86_64-linux";

      lib = nixpkgs.lib;
      overlays = [
        (import ./pkgs)
      ];
      pkgs = import nixpkgs {
        inherit system;
        overlays = overlays;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
    in {
      nixosConfigurations = {
        nixos = lib.nixosSystem {
          inherit system;

          specialArgs = {
            inherit pkgs-unstable;
            inherit username inputs;
          };
          modules = with inputs; [
            ./nixos/configuration.nix
            spicetify-nix.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        ${username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          extraSpecialArgs = {
            inherit pkgs-unstable;
            inherit username system theme inputs;
            inherit (inputs.nix-colors.lib-contrib {inherit pkgs;}) gtkThemeFromScheme;
          };
          modules = with inputs; [ 
            ./home/home.nix
            nixcord.homeModules.nixcord
            nix-colors.homeManagerModules.default
            textfox.homeManagerModules.default
          ];
        };
      };
    };
}
