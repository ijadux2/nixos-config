{ config, pkgs, lib, ... }:

{
  home.username = "jadu";
  home.homeDirectory = "/home/jadu";

  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    starship
    zoxide
    zsh-autosuggestions
    zsh-syntax-highlighting
    zip
    unzip
    eza
    gnome-tweaks
    gnomeExtensions.dock-from-dash
    ripgrep
    nodejs
    nix-ld
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  imports = [
    ./lua/plugins.nix
  ];

  
  
  

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins = [ "git" "sudo" ];
    };
    shellAliases = {
      ll = "ls -l";
      update = "home-manager switch";
      rebuild = "sudo nixos-rebuild switch --flake /home/jadu/codespace/nixos-config#itachi";
      v = "nvim";
      x = "clear";
      q = "exit";
      y = "yazi";
      cd = "z";
      ls = "eza --icons";
      lt = "eza --icons --tree";
      code = "opencode";
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      eval "$(starship init zsh)"
      eval "$(zoxide init zsh)"
export PATH="$HOME/.opencode/bin:$PATH"
    '';
  };
}

