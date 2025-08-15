{ config, pkgs, ... }: 
{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    BROWSER = "firefox";
    TERM = "ghostty";
  };
}
