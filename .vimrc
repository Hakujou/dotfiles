syntax on

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

au! BufNewFile,BufReadPost *.{yaml,yml,sls} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
