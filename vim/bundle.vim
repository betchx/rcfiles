" Global Bundle file for NeoBundle

" This file was made from readme of NeoBundle

" My Bundles here:
NeoBundle 'Shougo/neocomplcache'
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

