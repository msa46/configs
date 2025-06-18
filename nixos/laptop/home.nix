{ config, inputs, pkgs, ... }:

{
  	# Home Manager needs a bit of information about you and the
  	# paths it should manage.
  	home.username = "hq";
  	home.homeDirectory = "/home/hq";

  	# This value determines the Home Manager release that your
  	# configuration is compatible with. This helps avoid breakage
  	# when a new Home Manager release introduces backwards
  	# incompatible changes.
  	home.stateVersion = "25.05";

  	# Let Home Manager install and manage itself.
  	programs.home-manager.enable = true;

	programs.nvf = {
    		enable = true;
    		# your settings need to go into the settings attribute set
    		# most settings are documented in the appendix
    		settings = {
      			vim.viAlias = false;
      			vim.vimAlias = true;
      			vim.lsp = {
        			enable = true;
      			};
    		};
  	};
}

