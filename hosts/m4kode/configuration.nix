{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  ];

  homebrew = {
    enable = true;
    onActivation.cleanup = "uninstall";
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;
    taps = [];
    brews = [
      "podman"
      "podman-compose"
      "node"
      "gemini-cli"
    ];
    casks = [ 
      "1password"
      "1password-cli"
      "kitty"
      "proton-mail"
      "brave-browser"
#      "alfred"
      "raycast"
      "little-snitch"
      "protonvpn"
      "calibre"
      "rectangle"
      "citrix-workspace"
      #"rustdesk"
      "font-jetbrains-mono-nerd-font"
      "notchnook"
      "zoom"
      "tor-browser"
      "bartender"
      "podman-desktop"
      "claude"
      "firefox"
      "proton-mail-bridge"
      "thunderbird"
      "gemini"
    ];
  };


  system.primaryUser = "bcr";
  system.stateVersion = 6;

  system.defaults = {
    dock = {
      autohide = true; 
      orientation = "left";
      show-process-indicators = false;
      show-recents = false;
      static-only = false;
    };

    finder = {
      AppleShowAllExtensions = true;
      ShowPathbar = true;
      FXPreferredViewStyle = "Nlsv";
      #FXEnableExtensionsChangeWarning = false;
    };

    loginwindow.LoginwindowText = "Authorized Users Only - m4kode";
    screencapture = { 
      location = "~/Pictures/screenshots/";
      disable-shadow = true;
      include-date = true;
      show-thumbnail = false;
      target = "file";
    };
  };

  security.pam.services.sudo_local.touchIdAuth = true;


  users.users.bcr = {
    home = "/Users/bcr";
  };

  nix.extraOptions = ''
    auto-optimise-store = true
    experimental-features = nix-command flakes
  '';
}
