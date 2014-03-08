" 共通の設定
"
"　インデント幅を狭く
set shiftwidth=2


" Cofigulation from http://www.oki-osk.jp/esc/cyg/cygwin-23.html
set ambw=double

"日本語の行の連結時には空白を入力しない
set formatoptions+=mM

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"再読込、vim終了後も継続するアンドゥ(7.3)
if version >= 703
  "Persistent undoを有効化(7.3)  "
  set undofile
  "アンドゥの保存場所(7.3)  "
  set undodir=./.vimundo,~/.vimundo
endif

" 基本的にはタブは使わない．
set expandtab

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

