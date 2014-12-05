
if has("autocmd")
  " ==============================================
  " Shell

  " Bashとして扱う．　(実質shは使わないので）
  " 参考：　http://d.hatena.ne.jp/tyru/20101007/vim_syntax_sh の mattn氏のコメ
  " ント
   autocmd FileType sh let b:is_bash = 1

  " ==============================================
  " Fortran
  " f90ファイルの場合はenddoを使う
  au! BufRead, BufNewFile *.f90 let b:fortran_do_enddo=1
endif


