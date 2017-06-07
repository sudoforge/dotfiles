set nocompatible
filetype off

" load vundle and plugins
try
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    source ~/.vim/modules/plugins.vim
    call vundle#end()
catch
endtry

" include options module
source ~/.vim/modules/options.vim
