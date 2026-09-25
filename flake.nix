{
	description = "My system configuration";

  	inputs = {
    	nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    	home-manager = {
    		url = "github:nix-community/home-manager";
    		inputs.nixpkgs.follows = "nixpkgs";
    	};
    	zen-browser = {
    		url = "github:youwen5/zen-browser-flake";
        	inputs.nixpkgs.follows = "nixpkgs";
    	};
    	disko = {
    	      url = "github:nix-community/disko";
    	      inputs.nixpkgs.follows = "nixpkgs";
    	};
    	nixvim = {
    		url = "github:nix-community/nixvim";
    		inputs.nixpkgs.follows = "nixpkgs";
    	};
    	
	};

  	outputs = {self, nixpkgs, home-manager, disko, nixvim,  ...}@inputs:
    	let 
    		system = "x86_64-linux";
		in

		{
			nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
				inherit system;
				specialArgs = { inherit inputs; };
				modules = [
					./nixos/configuration.nix
					disko.nixosModules.disko
				];
			};
			homeConfigurations.timojj = home-manager.lib.homeManagerConfiguration {
				pkgs = nixpkgs.legacyPackages.${system};
				modules = [
					nixvim.homeModules.nixvim
					./home-manager/home.nix
				];
				extraSpecialArgs = { inherit inputs; };
			};				
		};
}

