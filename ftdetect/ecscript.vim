" Vim ftdetect plugin file
" Language:	      EcScript
" Maintainer:	      Peter Lustig <peter.lustig@energid.com>
" Version:            2.1
" Project Repository: https://github.com/Energid/vim-ecscript

au  BufNewFile,BufRead  *.ecs       set filetype=ecscript
au BufNewFile,BufRead  *.ecscript  set filetype=ecscript
