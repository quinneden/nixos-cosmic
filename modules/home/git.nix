{ pkgs, ... }: 
{
  programs.git = {
    enable = true;
    
    userName = "Quinn Edenfield";
    userEmail = "quinnyxboy@gmail.com";
    
    extraConfig = { 
      init.defaultBranch = "main";
      # credential.helper = "store";
      http.postBuffer = "524288000";
    };
  };

  home.packages = [ pkgs.gh pkgs.git-lfs ];

home.file.".gitconfig".text = ''
[credential "https://github.com"]
	helper = 
	helper = !/etc/profiles/per-user/quinn/bin/gh auth git-credential
[credential "https://gist.github.com"]
	helper = 
	helper = !/etc/profiles/per-user/quinn/bin/gh auth git-credential
'';
}
