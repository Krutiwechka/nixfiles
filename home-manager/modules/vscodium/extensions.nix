{pkgs, ...}:
{
	programs.vscodium.profiles.default.extensions = with pkgs.vscode-extensions; [
		adpyke.codesnap
		dracula-theme.theme-dracula
		eamodio.gitlens
		pkief.material-product-icons
		redhat.java
		vscjava.vscode-gradle
		vscjava.vscode-java-debug
		vscjava.vscode-java-dependency
		vscjava.vscode-java-pack
		vscjava.vscode-java-test
		vscjava.vscode-maven
	];
}
