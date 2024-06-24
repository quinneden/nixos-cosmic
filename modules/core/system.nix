{
  self,
  pkgs,
  lib,
  inputs,
  ...
}: {
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      substituters = ["https://cosmic.cachix.org/"];
      trusted-public-keys = ["cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 4d";
    };
  };

  environment.systemPackages = with pkgs; [
    asahi-bless
    asahi-btsync
    asahi-nvram
    btrfs-progs
    gparted
    git
  ];

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  system.stateVersion = "24.05";
}
