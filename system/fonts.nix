{pkgs, ...}: {
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    jetbrains-mono
    ibm-plex
    maple-mono
    maple-mono-NF
    maple-mono-SC-NF
    iosevka
    fira-code-symbols
    nerdfonts
    powerline-fonts
    symbola
    noto-fonts-color-emoji
    material-icons
  ];
}
