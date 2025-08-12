{ config, pkgs, ...}:
{
  environment.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERM = "ghostty";
  };
}
