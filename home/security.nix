{ pkgs, ... }: {
 
  home.stateVersion = "25.04";

  home.packages = with pkgs; [
    mullvad-browser
    tor-browser
    nmap
  ];
}