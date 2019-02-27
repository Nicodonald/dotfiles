@echo 
SET DIR=%~dp0

cmd /c mklink /d "%LOCALAPPDATA%\nvim" "%DIR%\.config\nvim"
cmd /c mklink "%USERPROFILE%\.vimrc" "%DIR%\.vimrc"
cmd /c mklink /d "%USERPROFILE%\.vim" "%DIR%\.vim"
nvim --headless +PluginInstall +qa
