{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs;[
		telegram-desktop
		whatsie
	];
}
