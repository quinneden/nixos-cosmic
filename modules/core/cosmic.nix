{
  pkgs,
  nixos-cosmic,
  inputs,
  ...
}: {
  imports = [nixos-cosmic.nixosModules.default];

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
    libinput.enable = true;
    gnome.gnome-keyring.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-cosmic
      xdg-desktop-portal-gtk
    ];
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        user = "cosmic-greeter";
        command = ''${pkgs.coreutils}/bin/env XCURSOR_THEME="''${XCURSOR_THEME:-Pop}" systemd-cat -t cosmic-greeter ${pkgs.cosmic-comp}/bin/cosmic-comp ${pkgs.cosmic-greeter}/bin/cosmic-greeter'';
      };
    };
  };
}
