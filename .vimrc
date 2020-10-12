syntax on

set tabstop=4 softtabstop=0 shiftwidth=4
set noexpandtab

au! BufNewFile,BufReadPost *.{yaml,yml,sls} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
