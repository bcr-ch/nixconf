{ config, pkgs, ... }:

{

  services.gnome.gnome-remote-desktop.enable = true; # 'true' does not make the unit start automatically at boot
  systemd.services.gnome-remote-desktop = { 
    wantedBy = [ "graphical.target" ]; # for starting the unit automatically at boot
  };
  services.displayManager.autoLogin.enable = false;
  services.getty.autologinUser = null;

}