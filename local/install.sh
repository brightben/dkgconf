#!/bin/sh
echo 'The following files will be replaced.'
ls -al \
    ~/.bashrc \
    ~/.gitconfig \
    ~/.screenrc \
    ~/.vim \
    ~/.vimrc \
    ~/.pyrc.py \
    ~/bin \
    
    
while [ 1 ]; do
    printf 'continue? (Y/n)'
    read ans
    case $ans in
        [Yy]*)
            break;;
        [Nn]*)
            exit 0;;
    esac
done

rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.screenrc
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.pyrc.py
rm -rf ~/bin

cp dkgconf/local/gitconfig.template  dkgconf/local/gitconfig

ln -s dkgconf/local/bashrc      ~/.bashrc
ln -s dkgconf/local/gitconfig   ~/.gitconfig
ln -s dkgconf/local/screenrc    ~/.screenrc
ln -s dkgconf/local/vim         ~/.vim
ln -s dkgconf/local/vimrc       ~/.vimrc
ln -s dkgconf/local/pyrc.py     ~/.pyrc.py
ln -s dkgconf/local/bin         ~/bin

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo '============'
    echo 'Setup Vundle'
    echo '============'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c 'BundleInstall' -c 'q' -c 'q'
fi

echo '...done'

