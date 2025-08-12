{ pkgs, ... }: {
  home.packages = with pkgs; [
    pywal
  ];
}
