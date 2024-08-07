{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    x11docker
    tinygo
    libwebp
    chiaki
    qrencode
    onefetch # code fetch for git repos and etc...
    tokei
    cloc # count lines of code
    smartcrop
    sox
    graphviz
    cfonts
    # mangal
    vkbasalt
    vkbasalt-cli
    tesseract
    blahaj
    wallust
    torsocks
    xdg-ninja
    bpftrace
    mpvpaper
    libtree
    wlr-which-key
    scope-tui
    ripdrag
    cava
    exfat
    exfatprogs
    ytfzf
    fdk-aac-encoder
    hugo
    zs
    openai-whisper-cpp
    bc
    timer
    at
    # nvidia-container-toolkit
    # cudatoolkit
    crun
    dig
    cachix
    exiftool
    flite
    sops
    age
    apktool
    jadx
    hyfetch
    wol # wake on LAN
    topgrade
    evsieve
    # netscanner
    didder
    tofi
    bemenu
    j4-dmenu-desktop
    moreutils
    scrcpy
    katana
    typos
    cowsay
    xurls
    libqalculate
    lazygit
    watershot
    fish
    scc
    hyperfine
    lsof
    tgpt
    grimblast
    spotify-player
    niv
    wl-mirror
    viddy
    lutgen
    ydotool
    lolcat
    cmatrix
    socat
    yad
    nh
    appimage-run
    zsh
    zellij
    tmux
    usbutils
    podman
    coreutils
    binutils
    pciutils
    dmidecode
    playerctl
    ffmpeg_6-full
    imagemagick
    gifsicle
    pastel
    delta
    figlet
    ncdu
    fortune
    fortune-kind
    glow
    mdcat
    upx
    pup
    duf
    fastfetch
    pridefetch
    neovide
    toot
    bubblewrap
    tealdeer
    yt-dlp
    pipx
    bat
    zoxide
    xxd
    yazi
    file
    ffmpeg
    image_optim
    killall
    fd
    ripgrep
    ripgrep-all
    curl
    gitAndTools.gitFull
    git-lfs
    man
    mkpasswd
    unzip
    direnv
    pandoc
    fzf
    eza
    wget
    starship
    neofetch
    gallery-dl
    gh
    piper-tts
    jq
    ollama
    just
    silicon
    gum
    manix
    ani-cli
    aria2
    qbittorrent-nox
    vim
  ];
}
