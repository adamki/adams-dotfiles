syntax on                                       " enable syntax
set background=dark                             " must go before :colorscheme
let g:nord_comment_brightness = 20              " bright comments. (1 - 20)
colo one                                 " must go after set bg
let g:enable_italic_font = 1                    " Make sure to italicize

" transparent guiBG
hi! Normal ctermbg=NONE guibg=NONE
hi! Nontext ctermbg=NONE guibg=NONE

let g:airline_theme='one'                " Airline theme

let g:airline_left_sep ='▛ '
let g:airline_right_sep = '▞'

let g:airline#extensions#tabline#left_sep = '▛ '
let g:airline#extensions#tabline#right_sep = '▞'
