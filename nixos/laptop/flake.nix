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
  };

  outputs = inputs@{ self, nixpkgs, ... }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.default = self.packages.x86_64-linux.hello;
    nixosConfigurations = {
	hq = nixpkgs.lib.nixosSystem{
		specialArgs = {inherit inputs; };
		system = "x86_64-linux";
		modules = [
		./configuration.nix
		];	
	};
    };

  };
}
