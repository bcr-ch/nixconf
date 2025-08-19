{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.rustdesk-flutter
  ];
}