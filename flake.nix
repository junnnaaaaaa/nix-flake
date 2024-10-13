{
  description = "My favourite NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";
  
  

  pkgs = import nixpkgs {
    inherit system;
  };

  config = {
    allowUnfree = true;
  };

  in 
	{
  nixosConfigurations = {
    myNixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
        ./nixos/configuration.nix
      ];
    };
  };
};
}
