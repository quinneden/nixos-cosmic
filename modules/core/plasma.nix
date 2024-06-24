{pkgs, ...}: {
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    desktopManager.plasma6.enable = true;

    libinput.enable = true;

    xserver = {
      enable = true;
      xkb.layout = "us";
    };
  };

  programs.xwayland.enable = true;

  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
