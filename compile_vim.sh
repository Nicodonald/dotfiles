#sudo yum -y install epel-release
#sudo yum -y install gcc-c++ ncurses-devel python python-devel python36 python36-devel
#sudo apt install ncurses-dev python python-dev python3 python3-dev
#yum list installed | grep -i vim
# sudo yum erase vim-common.x86_64 vim-enhanced.x86_64 vim-filesystem.x86_64 vim-X11

# sudo depends on vim-minimal
#sudo rpm -e --nodeps vim-minimal

#cd
#git clone https://github.com/vim/vim.git
cd ~/vim
./configure --with-features=huge \
--enable-pythoninterp=yes \
--enable-python3interp=yes \
--enable-multibyte \
--disable-tclinterp \
--enable-cscope \
--with-tlib=ncurses \
--enable-fail-if-missing \
--disable-darwin \
--enable-terminal \
--enable-fontset

#make VIMRUNTIMEDIR=/usr/local/share/vim/vim81
#make 
#sudo make install

#hash -r

