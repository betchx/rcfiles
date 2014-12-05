if neobundle#is_installed('vim-monster')
  if neobundle#is_installed('neocomplete')
    let g:neocomplete#sources#omni#input_patterns = {
          \ "ruby" : '[^. *\t]\.\w*\|\h\w*::',
          \}
  endif
endif

