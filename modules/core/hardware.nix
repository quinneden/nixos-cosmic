{
  pkgs,
  config,
  inputs,
  modulesPath,
  lib,
  ...
}: {
  imports = with inputs; [
    nixos-apple-silicon.nixosModules.apple-silicon-support
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  hardware.bluetooth.enable = true;

  hardware.opengl = {
    enable = true;
  };

  hardware.asahi = {
    peripheralFirmwareDirectory = ../../firmware;
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "replace";
    withRust = true;
  };

  zramSwap = {
    enable = true;
    memoryPercent = 100;
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
    initrd = {
      availableKernelModules = ["xhci_pci" "usbhid" "usb_storage"];
      kernelModules = [];
    };
    kernelModules = [];
    extraModulePackages = [];
  };

  # fileSystems."/" = {
  #   device = "/dev/disk/by-label/nixos";
  #   fsType = "ext4";
  # };

  # fileSystems."/boot" = {
  #   device = "/dev/disk/by-uuid/";
  #   fsType = "vfat";
  #   options = ["fmask=0022" "dmask=0022"];
  # };

  swapDevices = [];

  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
