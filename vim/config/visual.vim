
" Setting for visualization
"

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
endif

"検索文字の強調表示
"set hlsearch
" をしない colorscheme blueではとっても見にくいため
set nohlsearch

" コンソール用の色設定
colorscheme blue

"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~

" 行末の空白等を赤で表示
hi SpecialKey ctermbg=Red



