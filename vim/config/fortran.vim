
" f90ファイルの場合はendoを使う
if has("autocmd")
  au! BufRead, BufNewFile *.f90 let b:fortran_do_enddo=1
endif


