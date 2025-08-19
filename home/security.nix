{ pkgs, ... }: {
 
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    #mullvad-browser
    #tor-browser
    nmap
  ];
}
