{pkgs, ...}: {
  imports = [
    ./java.nix
  ];

  home.packages = with pkgs; [
    # ts/js
    nodejs
    bun
    yarn
    typescript
    deno

    # Rust
    rustc
    cargo

    postgresql

    # py
    python311
    uv

    # cli
    curl
    gh
    wget
    zip
    unzip
    jq
    zoxide
  ];

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
