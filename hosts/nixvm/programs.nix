{ config, pkgs, ... }:

{
  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = [ "bcr" ];
  };  
  #programs._1passwrd-cli.enable = true;

  environment.systemPackages = [
    pkgs._1password-cli
    pkgs.gnomeExtensions.appindicator
  ];

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        brave
      '';
      mode = "0755";
    };
  };

  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

}