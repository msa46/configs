{ config, pkgs, system, inputs, ... }:

{
  home.username = "hq";
  home.homeDirectory = "/home/hq";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    zip
    xz
    unzip
    p7zip
    oh-my-zsh
   oh-my-posh
    inputs.zen-browser.packages."${system}".specific
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "msa46";
    userEmail = "mohamad.sanaye462@gmail.com";
    extraConfig = {
        init.defaultBranch = "main";
    };
  };


  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  #home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  #programs.home-manager.enable = true;
}
