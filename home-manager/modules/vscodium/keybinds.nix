{
	programs.vscode.profiles.default.keybindings =[
		  {
		    key = "ctrl+q";
		    command = "editor.action.jumpToBracket";
		    when = "editorTextFocus";
		  }
		
		  {
		    key = "ctrl+shift+\\";
		    command = "-editor.action.jumpToBracket";
		    when = "editorTextFocus";
		  }
		
		  {
		    key = "ctrl+shift+q";
		    command = "editor.action.selectToBracket";
		  }
		
		  {
		    key = "ctrl+shift+up";
		    command = "-editor.action.insertCursorAbove";
		    when = "editorTextFocus";
		  }
		
		  {
		    key = "ctrl+shift+down";
		    command = "-editor.action.insertCursorBelow";
		    when = "editorTextFocus";
		  }
		
		  {
		    key = "ctrl+shift+down";
		    command = "cursorDownSelect";
		    when = "textInputFocus";
		  }
		
		  {
		    key = "ctrl+shift+up";
		    command = "cursorUpSelect";
		    when = "textInputFocus";
		  }
		
		  {
		    key = "ctrl+shift+up";
		    command = "cursorUpSelect";
		    when = "editorColumnSelection";
		  }
	];
}
