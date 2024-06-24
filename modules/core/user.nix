{
  pkgs,
  inputs,
  host,
  config,
  ...
}: {
  imports = [inputs.home-manager.nixosModules.home-manager];
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs host;};
    users.quinn = {
      imports = [./../home];
      home.username = "quinn";
      home.homeDirectory = "/home/quinn";
      home.stateVersion = "24.11";
      programs.home-manager.enable = true;
    };
  };

  users.users.quinn = {
    isNormalUser = true;
    extraGroups = ["wheel"];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = ["quinn" "root"];
}
