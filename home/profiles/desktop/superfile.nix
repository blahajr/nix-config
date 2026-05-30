{...}: {
  programs.superfile = {
    enable = true;
    firstUseCheck = false;

    settings = {
      theme = "catppuccin-mocha";
      transparent_background = true;
    };
  };
}
