{
  description = "nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    walt.url = "github:gitfudge0/walt";
    walt.inputs.nixpkgs.follows = "nixpkgs";

    silentSDDM.url = "github:uiriansan/SilentSDDM";
    silentSDDM.inputs.nixpkgs.follows = "nixpkgs";

    catppuccin.url = "github:catppuccin/nix/v25.11";
    catppuccin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    systems = [
      "aarch64-linux"
      "i686-linux"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs systems;

    mkHomeConfiguration = {
      hostName,
      modules,
    }:
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [
          ./modules/settings.nix
          inputs.catppuccin.homeModules.catppuccin
        ]
        ++ modules;
        extraSpecialArgs = {
          inherit inputs hostName;
        };
      };
  in {
    formatter = forAllSystems (
      system:
        nixpkgs.legacyPackages.${system}.alejandra
    );

    checks = forAllSystems (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        statix = pkgs.runCommand "statix-check" {} ''
          ${pkgs.statix}/bin/statix check ${./.}
          touch $out
        '';
        deadnix = pkgs.runCommand "deadnix-check" {} ''
          ${pkgs.deadnix}/bin/deadnix ${./.}
          touch $out
        '';
      }
    );

    nixosModules = {
      settings = import ./modules/settings.nix;
      thinkpad = import ./modules/system/thinkpad;
      homelab = import ./modules/system/homelab;
      users = import ./modules/system/users.nix;
    };
    homeManagerModules = import ./modules/home-manager;

    homeConfigurations = {
      "blahja@thinkpad" = mkHomeConfiguration {
        hostName = "thinkpad";
        modules = [./home/blahja/thinkpad];
      };
      "root@homelab" = mkHomeConfiguration {
        hostName = "homelab";
        modules = [./home/root];
      };
    };

    nixosConfigurations = {
      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/settings.nix
          ./hosts/thinkpad/default.nix
          home-manager.nixosModules.home-manager
        ];
      };

      homelab = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./modules/settings.nix
          ./hosts/homelab/default.nix
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
