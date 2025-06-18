{
  description = "A very basic flake";

  inputs = {
    	nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

      	zen-browser = {
    		url = "github:0xc000022070/zen-browser-flake";
    		# IMPORTANT: we're using "libgbm" and is only available in unstable so ensure
    		# to have it up-to-date or simply don't specify the nixpkgs input  
    		inputs.nixpkgs.follows = "nixpkgs";
  	};
	home-manager = {
		url = "github:nix-community/home-manager";
    		inputs.nixpkgs.follows = "nixpkgs";
	};
	nvf.url = "github:notashelf/nvf";
	
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nvf, ... }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    
    nixosConfigurations.hq = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		system = "x86_64-linux";
		modules = [
		./configuration.nix
		home-manager.nixosModules.home-manager{
			home-manager.useGlobalPkgs = true;
          		home-manager.useUserPackages = true;
          		home-manager.extraSpecialArgs = { inherit inputs; };
		}
		];	
	};
    
    homeConfigurations.hq = home-manager.lib.homeManagerConfiguration {
	pkgs = nixpkgs.legacyPackages.x86_64-linux;
	extraSpecialArgs = { inherit inputs; };
	modules = [
		nvf.homeManagerModules.default
		./home.nix
	];
    };

  };

}
