{pkgs, ...}: let
  yaziFlavors = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "flavors";
    rev = "36c49acfd7d3924bd751fd74e37b6ff438af691a";
    hash = "sha256-IK0Ye/EPjOGC+//HpjExVTAKfXtlgOrYbFLrhy/DF6k=";
  };
in {
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    flavors = {
      catppuccin-mocha = "${yaziFlavors}/catppuccin-mocha.yazi";
    };

    theme = {
      flavor = {
        dark = "catppuccin-mocha";
      };
    };
  };
}
