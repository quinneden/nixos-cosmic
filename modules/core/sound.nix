{
  pkgs,
  inputs,
  ...
}: {
  imports = with inputs; [
    nixos-apple-silicon.nixosModules.apple-silicon-support
  ];

  hardware.asahi.setupAsahiSound = true;
  sound.enable = true;

  environment.systemPackages = with pkgs; [
    wireplumber
  ];
}
