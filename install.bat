@echo 
SET DIR=%~dp0

cmd /c mklink /d "%LOCALAPPDATA%\nvim" "%DIR%\.config\nvim"
cmd /c mklink "%USERPROFILE%\.vimrc" "%DIR%\.vimrc"
cmd /c mklink /d "%USERPROFILE%\.vim" "%DIR%\.vim"
git clone https://github.com/VundleVim/Vundle.vim.git %DIR%/.vim/bundle/Vundle.vim
nvim --headless +PluginInstall +qa
