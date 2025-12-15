{
  description = "A Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    utils = {
      url = "github:vivAnicc/nix-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixvim, utils, ... }: utils.lib.mkFlake (system: let
      nixvim' = nixvim.legacyPackages.${system};
      nixvimModule = {
        inherit system;
        module = import ./config.nix;
        extraSpecialArgs = {
        };
      };
      nvim = nixvim'.makeNixvimWithModule nixvimModule;
    in {
      nixvimModules.default = import ./config.nix;
      packages.${system} = {
        inherit nvim;
        default = nvim;
      };
    });
}
