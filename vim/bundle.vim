" Global Bundle file for NeoBundle

" This file was made from readme of NeoBundle

" My Bundles here:


" Switch conpletion plugin by requirement.
if has("lua")
  " NeoComplete requires if_lua
  NeoBundle 'Shougo/neocomplete'
else
  " NoLua
  NeoBundle 'Shougo/neocomplcache'
endif


NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'xmledit'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'flazz/vim-colorschemes'

" Git
NeoBundle 'tpope/vim-fugitive'

" Unite
NeoBundle 'Shougo/unite.vim'

" Unite sources
NeoBundle 'Shougo/unite-outline'
NeoBundle 'rhysd/unite-ruby-require.vim'


" From Vim Technique Bible

" SpeedDating
NeoBundle 'tpope/vim-speeddating'


" For Ruby
" see http://qiita.com/alpaca_taichou/items/ab2ad83ddbaf2f6ce7fb
NeoBundle 'AndrewRadev/switch.vim'


" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" inc
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

