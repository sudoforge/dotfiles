set nocompatible
filetype off

" load vundle and plugins
try
    set rtp+=/usr/share/vim/vimfiles/autoload/vundle.vim  " aur/vundle install path
    set rtp+=~/.vim/bundle/Vundle.vim " manual install path
    call vundle#begin()
    source ~/.vim/modules/plugins.vim
    call vundle#end()
catch
endtry

" include options module
source ~/.vim/modules/options.vim
