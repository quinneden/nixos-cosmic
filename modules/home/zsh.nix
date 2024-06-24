{ hostname, config, pkgs, host, ...}: 
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "fzf" "eza" "zsh-navigation-tools" ];
    };
    initExtraFirst = ''
      DISABLE_MAGIC_FUNCTIONS=true
      export "MICRO_TRUECOLOR=1"
      EZA_ICON_SPACING=2
      SCRIPTS="$HOME/.config/lazarus/modules/home/scripts/scripts"
      TERM="xterm-256color"

      for i in $HOME/.config/completions/*; source $i
    '';
    shellAliases = {
      c = "clear";
      cd = "z";
      nano = "micro";
      mi = "micro";
      code = "codium";
      py = "python";
      icat = "kitten icat";
      dsize = "du -hs";
      findw = "grep -rl";
      surf = "sudo rm -rf";
      fuck = "sudo rm -rf";
      rf = "rm -rf";
      l = "eza --icons  -a --group-directories-first";
      la = "eza -a1 --";
      ll = "eza --icons  -a --group-directories-first --long --git --group";
      tree = "eza --icons --tree --group-directories-first";

      # Nixos
      cdnix = "cd $FLAKE_DIR";
      scripts = "~/.config/lazarus/modules/home/scripts/scripts";
      codenix = "cd ~/.config/lazarus && codium ~/.config/lazarus";
      nix-switch = "sudo nixos-rebuild switch --flake ~/.config/lazarus#${host} --impure";
      switch = "sudo nixos-rebuild switch --flake ~/.config/lazarus#${host} --impure";
      switchup = "sudo nixos-rebuild switch --flake ~/.config/lazarus#${host} --impure";
      nix-switchu = "sudo nixos-rebuild switch --upgrade --flake ~/.config/lazarus#${host} --impure";
      flake-update = "sudo nix flake update ~/.config/lazarus";
      nix-clean = "sudo nix-collect-garbage && sudo nix-collect-garbage -d && sudo rm /nix/var/nix/gcroots/auto/* && nix-collect-garbage && nix-collect-garbage -d";

      # Git
      ga   = "git add";
      gaa  = "git add --all";
      gs   = "git status";
      status = "git status";
      gpl  = "git pull";
      gplo = "git pull origin";
      gp = "git push";
      gpo = "git push origin";
      commit = "git commit --all --allow-empty-message --no-edit";
      gc = "git commit -m";
      gtag = "git tag -ma";
      gch  = "git checkout";
      gchb = "git checkout -b";
      gcoe = "git config user.email";
      gcon = "git config user.name";
    };

    # plugins = [
    # {
    #   name = "";
    #   file = "share/zsh/$[PLUGIN]/$[PLUGIN].zsh";
    #   src = pkgs.$[PLUGIN];
    # }];
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
