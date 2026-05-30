{
  ...
}: {
  services.xserver.enable = true;

  services.displayManager.defaultSession = "hyprland";

  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
