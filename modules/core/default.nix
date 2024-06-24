{
  inputs,
  nixpkgs,
  self,
  username,
  host,
  ...
}: {
  imports =
    [(import ./hardware.nix)]
    # ++ [(import ./plasma.nix)]
    ++ [(import ./cosmic.nix)]
    ++ [(import ./network.nix)]
    ++ [(import ./sound.nix)]
    ++ [(import ./program.nix)]
    ++ [(import ./security.nix)]
    ++ [(import ./services.nix)]
    ++ [(import ./system.nix)]
    ++ [(import ./user.nix)];
}
