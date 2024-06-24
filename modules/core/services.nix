{...}: {
  services = {
    gvfs.enable = true;
    blueman.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
  };

  services.logind.extraConfig = ''
    # don’t shutdown when power button is short-pressed
    HandlePowerKey=ignore
  '';
}
