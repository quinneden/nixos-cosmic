{pkgs, ...}: {
  networking = {
    hostName = "nixos-macmini";
    wireless.iwd = {
      enable = true;
      settings.General.EnableNetworkConfiguration = true;
    };
    nameservers = ["1.1.1.1"];
    firewall = {
      enable = true;
      allowedTCPPorts = [22 80 443 59010 59011];
      allowedUDPPorts = [59010 59011];
    };
  };
}
