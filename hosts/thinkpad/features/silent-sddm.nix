{
  inputs,
  lib,
  ...
}: {
  imports = [inputs.silentSDDM.nixosModules.default];

  programs.silentSDDM = {
    enable = true;
    theme = "catppuccin-mocha";

    # settings = {
    #   General = {
    #     background-fill-mode = "fill";
    #   };

    #   LoginScreen = {
    #     background = "default.jpg";
    #     use-background-color = false;
    #     blur = 12;
    #     brightness = 0.85;
    #   };

    #   LockScreen = {
    #     background = "default.jpg";
    #     use-background-color = false;
    #     blur = 12;
    #     brightness = 0.85;
    #   };
    # };
  };

  services.displayManager.sddm.wayland.enable = lib.mkForce true;
}
