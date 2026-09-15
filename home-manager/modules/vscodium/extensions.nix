{pkgs, ...}:
{
	programs.vscodium.profiles.default.extensions = with pkgs.vscode-extensions; [
		adpyke.codesnap
		dracula-theme.theme-dracula
		eamodio.gitlens
		pkief.material-product-icons

		#rust
		rust-lang.rust-analyzer
		vadimcn.vscode-lldb
		tamasfe.even-better-toml
		fill-labs.dependi
		usernamehw.errorlens
	];
}
