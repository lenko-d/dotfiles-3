" HASKELL

let g:haskell_indent_case_alternative = 1
let g:haskell_indent_in = 0
let g:haskell_indent_before_where = 2
let g:haskell_indent_after_bare_where = 2

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

hi! link haskellWhere          Keyword
hi! link haskellDecl           Keyword
hi! link haskellDeclKeyword    Keyword
hi! link haskellImportKeywords Keyword

let g:neoformat_enabled_haskell = ['brittany', 'stylishhaskell']

" let g:neomake_haskell_enabled_makers = ['hlint']

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

function! RunHasktagsIfExists()
  " Only regenerate existing tags.
  if filereadable('tags')
    call system('hasktags --ctags .')
  endif
endfunction

let g:haskell_project_errorformat = '%E%f:%l:%c:\ error:%#,' .
      \ '%W%f:%l:%c:\ warning:%#,' .
      \ '%W%f:%l:%c:\ warning:\ [-W%.%#]%#,' .
      \ '%f:%l:%c:\ %trror: %m,' .
      \ '%f:%l:%c:\ %tarning: %m,' .
      \ '%E%f:%l:%c:%#,' .
      \ '%E%f:%l:%c:%m,' .
      \ '%W%f:%l:%c:\ Warning:%#,' .
      \ '%C\ \ %m%#,' .
      \ '%-G%.%#'

augroup HaskellMaps
  au FileType haskell setlocal formatprg=hindent
  au FileType haskell,lhaskell setlocal makeprg=cabal\ v2-build
  au FileType haskell,lhaskell setlocal errorformat=g:haskell_project_errorformat
  " au BufWritePost *.hs :call RunHasktagsIfExists()
augroup END
