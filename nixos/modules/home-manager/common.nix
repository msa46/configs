{ config, pkgs, inputs, ... }:

{
	imports = [
    		inputs.nvf.homeManagerModules.default
  	];
  	programs.git = {
    		enable = true;
    		userName = "Mohammad Sanaye Abbasi";
    		userEmail = "mohamad.sanaye462@gmail.com";
  	};
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

