{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Go
    go
    gopls
    gotools
    goreleaser

    # DB
    boltbrowser
    badger
    sqlite
    sqlite-interactive

    # Rust
    rustup

    # Python
    python3

    # C and C++
    autoconf
    gcc
    gnumake
    libclang
    clang
    cmake
    stdenv.cc
    gnumake
    ninja
    pkg-config
    meson

    # Android
    android-studio

    # Zig
    zig
    zls

    # Assembly
    nasm
    asm-lsp
    nasmfmt

    # Nix
    nixd
    alejandra # nix formatter

    # HTML CSS JS
    bun
    nodejs_21
    typescript
    emmet-ls
    nodePackages.prettier

    # Utils
    gdb
    patchelf
    shfmt

    # Lua and LSP
    luaPackages.image-nvim
    luajitPackages.image-nvim
    lua51Packages.luarocks
    vscode-langservers-extracted
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.pyright
    nodePackages.stylelint
    nodePackages.vim-language-server
    nodePackages.yaml-language-server
    sumneko-lua-language-server
  ];
}
