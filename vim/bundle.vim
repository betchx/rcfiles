" Global Bundle file for NeoBundle

" This file was made from readme of NeoBundle

" My Bundles here:


" Switch conpletion plugin by requirement.
if has("lua")
  " NeoComplete requires if_lua
  NeoBundle 'Shougo/neocomplete', {'disabled' : !has('lua')}
else
  " In case of NoLua
  NeoBundle 'Shougo/neocomplcache', {'disabled' : has('lua')}
endif

" Snippets

NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" Additional Snipets
NeoBundle 'honza/vim-snippets'

" CommentAnyWay 
NeoBundle 'tyru/caw.vim.git'

" XML
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

" surround
NeoBundle 'tpope/vim-surround'


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

" Quick Run
NeoBundle 'thinca/vim-quickrun'

" display error in Vim
" http://d.hatena.ne.jp/osyo-manga/20120924/1348473304
NeoBundle 'osyo-manga/vim-watchdogs'

" quickrun hooks
NeoBundle 'osyo-manga/shabadou.vim'

" hilight error
NeoBundle 'jceb/vim-hier'


