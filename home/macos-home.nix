{ pkgs, ... }: {
  
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    neofetch
    htop
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = { 
      ignoreDups = true;
      ignoreSpace = true;
      save = 100000;
      size = 100000;
    };

 
    shellAliases = {
      ls = "ls --color";
      gonix = "sudo darwin-rebuild switch --flake ~/nix";
      nixgc = "nix-store --gc";
      ll = "ls -lahrts";
    };

    initContent = ''
      export ZSH="~/.oh-my-zsh"
      export EDITOR=vi
      export TERM=xterm-256color
      export LANG=en_US.UTF-8
      '';

    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [
        "git"
        "terraform"
        "history"
      ];
    };
  };
  
  programs.chromium = {
    enable = false;
    package = pkgs.brave;
    extensions = [
      { id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } #ublock origin light
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } #duckduckgo
      { id = "aeblfdkhhhdcdjpifhhbdiojplfjncoa"; } #1password
    ];
    commandLineArgs = [
      "--disable-features=WebRtcAllowInputVolumeAdjustment"
    ];
    #homepageLocation = "duckduckgo.com";
    #defaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
  };



  programs.firefox = {
    enable = false;
    policies = { 
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
        
      ExtensionSettings = {
        "*".installation_mode = "blocked";
        "uBlock@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "{d634138d-c276-4fc8-924b-40a0ea21d284}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/1password-x-password-manager/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };
  };
}
