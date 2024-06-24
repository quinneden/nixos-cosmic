{inputs, username, host, ...}: {
  imports =
    ++ [(import ./git.nix)]                       # version control
    ++ [(import ./packages.nix)]                  # other packages
    ++ [(import ./scripts/scripts.nix)]           # personal scripts
    ++ [(import ./starship.nix)]                  # shell prompt
    ++ [(import ./vscodium.nix)]                  # vscode fork
    ++ [(import ./zsh.nix)];                      # shell
}
