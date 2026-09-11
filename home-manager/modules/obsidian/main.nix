{
  programs.obsidian = {
    enable = true;
    defaultSettings = {
      app = {
		newFileLocation = "current";
		attachmentFolderPath = "attachments";
		alwaysUpdateLinks = true;
		showLineNumber = true;
		readableLineLength = true;
		strictLineBreaks = false;
		trashOption = "system";
      };
      appearance = {
        theme = "obsidian";
        interfaceFontFamily = "FiraCode Nerd Mono";
        monospaceFontFamily = "FiraCode Nerd Mono";
        baseFontSize = 16;
      };
    };

    vaults."main" = {
      enable = true;
      target = "Documents/obsidian-vault/vault/";
    };
  };
}
