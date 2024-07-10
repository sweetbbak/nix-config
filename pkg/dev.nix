{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Go
    go
    gopls
    delve
    gotools
    goreleaser

    # DB
    boltbrowser
    badger
    sqlite
    sqlite-interactive

    # C#
    dotnet-sdk_7
    csharp-ls

    # java
    java-language-server
    gradle
    openjdk11-bootstrap

    # Rust
    rustup

    # Python
    python3
    virtualenv
    python311Packages.pip

    # C and C++
    valgrind-light
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
    nodejs
    typescript
    emmet-ls
    nodePackages.prettier

    # Utils
    gdb
    patchelf
    shfmt
    iaito
    radare2
    imhex
    ghidra
    awscli
    s3scanner

    # Lua and LSP
    luaPackages.image-nvim
    luajitPackages.image-nvim
    lua51Packages.luarocks
    vscode-langservers-extracted
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    pyright
    nodePackages.stylelint
    nodePackages.vim-language-server
    nodePackages.yaml-language-server
    sumneko-lua-language-server
  ];
}
