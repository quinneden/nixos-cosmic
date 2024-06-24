{ lib, inputs, pkgs, config, ... }: 

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = "\$username\$hostname\$directory\$git_branch\$git_state\$git_status\$cmd_duration\$line_break\$python\$character";

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };

      directory = {
        style = "blue";
      };

      directory.substitutions = {
        "~" = "homedir";
        "lazarus" = " Lazarus";
      };

      cmd_duration = {
        disabled = true;
      };

      git_branch = {
        symbol = " ";
      };

      git_status = {
        format = "[[(*\$conflicted\$untracked\$modified\$staged\$renamed\$deleted)](218) (\$ahead_behind\$stashed)](\$style)";
        style = "cyan";
        conflicted = "";
        untracked = "";
        modified = "";
        staged = "";
        renamed = "";
        deleted = "";
        stashed = "≡";
      };

      nix_shell = {
        symbol = " ";
      };

      python = {
        format = "[\$virtualenv](\$style) ";
        style = "bright-black";
      };

      palette = "catppuccin_mocha";
    } // builtins.fromTOML (builtins.readFile "${inputs.catppuccin-starship}/palettes/mocha.toml");
  };
}
