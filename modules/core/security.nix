{...}: {
  security.polkit.enable = true;
  security.rtkit.enable = true;
  security.pam.services.cosmic-greeter = {};
  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
