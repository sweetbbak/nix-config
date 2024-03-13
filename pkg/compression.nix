{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    innoextract
    p7zip
    rar
    tarlz
    unar
    ouch
    squashfsTools
    squashfuse
  ];
}
