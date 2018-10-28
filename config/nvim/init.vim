" Setup Plug  --------------------------------------------------------------{{{

  call plug#begin('~/.local/share/nvim/plugged')
  " appearance - search - syntax - italix

  " colors
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'trevordmiller/nova-vim'
  Plug 'chriskempson/base16-vim'

  " syntax
  " Plug 'othree/yajs'
  " Plug 'othree/es.next.syntax.vim'
  " Plug 'jelera/vim-javascript-syntax'
  Plug 'sheerun/vim-polyglot'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'pangloss/vim-javascript'
  Plug 'elzr/vim-json'
  Plug 'othree/javascript-libraries-syntax.vim'

  " Folding (see fold section)
  Plug 'nelstrom/vim-markdown-folding', {'for': 'markdown'}

  " improve Vim interface
  Plug 'szw/vim-maximizer', {'on': ['Maximizer', 'MaximizerToggle']}
  Plug 'terryma/vim-expand-region'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}
  Plug 'ryanoasis/vim-devicons'
  Plug 'tomtom/tcomment_vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'airblade/vim-gitgutter'
  Plug 'shime/vim-livedown', {'for': 'markdown'}
  Plug 'easymotion/vim-easymotion'

  " vim extensions
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'jreybert/vimagit', {'on': ['Magit', 'MagitOnly']}
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-eunuch'
  Plug 'junegunn/fzf.vim'

  " IDE level enhancements
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  Plug 'ternjs/tern_for_vim', {'do': 'npm install'}
  Plug 'neomake/neomake'
  Plug 'benjie/neomake-local-eslint.vim'
  Plug 'jaawerth/neomake-local-eslint-first'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

  call plug#end()

" }}}

" ftplugin imports ---------------------------------------------------------{{{

  source ~/.config/nvim/ftplugin/aesthetic.vim
  source ~/.config/nvim/ftplugin/system.vim
  source ~/.config/nvim/ftplugin/keymappings.vim
  source ~/.config/nvim/ftplugin/nerdtree.vim
  source ~/.config/nvim/ftplugin/filetypes.vim

"  }}}

" MarkDown Live Previews ---------------------------------------------------{{{

  " should markdown preview get shown automatically upon opening markdown buffer
  let g:livedown_autorun = 1

  " should the browser window pop-up upon previewing
  let g:livedown_open = 1

" }}}

" Airline/TABS Config-------------------------------------------------------{{{

  " allow TAB to toggle windows
  nnoremap tq  :Sayonara<CR>
  nnoremap tt  :tabnew<CR>
  nnoremap tj  :tabnext<CR>
  nnoremap tk  :tabprev<CR>
  nnoremap th  :tabfirst<CR>
  nnoremap tl  :tablast<CR>
  nmap ]b :bnext<CR>
  nmap [b :bprev<CR>

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif                                                                " set up symbol dictionary

  let g:airline#extensions#tabline#enabled = 1                         " enables tabline
  let g:airline#extensions#tabline#buffer_idx_mode = 1                 " enable buffer indices
  let g:airline#extensions#neomake#error_symbol='E: '                   " neomake lint(error)

  let g:airline#extensions#neomake#warning_symbol='W:  '                " neomake lint(error)
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'  " show abbreviated filepath

  let g:airline#extensions#branch#enabled = 1
  let g:airline#extensions#branch#empty_message = 'Not in Git Repo'

  let g:airline_powerline_fonts = 1                                  " disabled cuz i dont have a patched font =(
  let g:airline_symbols.branch = ''                                 " git branch symbol!

  let g:airline#extensions#neomake#enabled = 1

  " tab shortcuts ----------------------------------------------------------{{{

    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    let g:airline#extensions#tabline#buffer_idx_format = {
          \ '0': '0 ',
          \ '1': '1 ',
          \ '2': '2 ',
          \ '3': '3 ',
          \ '4': '4 ',
          \ '5': '5 ',
          \ '6': '6 ',
          \ '7': '7 ',
          \ '8': '8 ',
          \ '9': '9 ',
          \}                                                             " make tab indices look normal

  "  }}}
" }}}

" Vim-Devicons -------------------------------------------------------------{{{

  " after a re-source, fix syntax matching issues (concealing brackets):
  if exists('g:loaded_webdevicons')
      call webdevicons#refresh()
  endif

  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {} " needed
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['js'] = ''
  let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vim'] = ''

" }}}

" Deoplete  ----------------------------------------------------------------{{{

  "start Deoplete always
  let g:deoplete#enable_at_startup = 1

  " use deoplete for .jsx
  let g:jsx_ext_required = 0

  autocmd CompleteDone * pclose
  let g:deoplete#file#enable_buffer_path=1

  " custom omni source markers
  call deoplete#custom#source('buffer', 'mark', 'ℬ')
  call deoplete#custom#source('ternjs', 'mark', '')
  call deoplete#custom#source('omni',   'mark', '⌾')
  call deoplete#custom#source('file',   'mark', 'file')

  " let carlitux Use deoplete.
  let g:tern_request_timeout = 1
  let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete

  " turn off case sensitive matches
  let g:deoplete#sources#ternjs#case_insensitive = 1

  "Add extra filetypes
  let g:tern#filetypes = [
                  \ 'jsx',
                  \ 'javascript.jsx',
                  \ 'vue'
                  \ ]

  " Use tern_for_vim.
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]

   " deoplete tab-complete
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

  " jump to definition
  autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR> let g:tern#is_show_argument_hints_enabled = 1
  " jump to definition in new buffer
  autocmd FileType javascript nnoremap <silent> <buffer> gb! :TernDefSplit<CR>

" }}}

" Javascript ---------------------------------------------------------------{{{

  " dont care about elzr/vim-json quote conceal
  let g:vim_json_syntax_conceal = 0

  " let pangloss/js handle flow
  let g:javascript_plugin_flow = 1

" }}}

" Fold, gets it's own section  ---------------------------------------------{{{

  function! MyFoldText() " {{{
    " Get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~? '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
      let line = getline(v:foldstart)
    else
      let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = ' ' . foldSize . ' lines '
    let foldLevelStr = repeat('+--', v:foldlevel)
    let lineCount = line('$')
    let foldPercentage = printf('[%.1f', (foldSize*1.0)/lineCount*100) . '%] '
    let expansionString = repeat('.', w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
  endfunction " }}}

  set foldtext=MyFoldText()

  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

  autocmd FileType vim setlocal fdc=1
  set foldlevel=99

  " Space to toggle folds.
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevel=0

  autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

  autocmd FileType css,scss,json setlocal foldmethod=marker
  autocmd FileType css,scss,json setlocal foldmarker={,}

  autocmd FileType coffee setl foldmethod=indent
  let g:xml_syntax_folding = 1
  autocmd FileType xml setl foldmethod=syntax

  autocmd FileType html setl foldmethod=expr
  autocmd FileType html setl foldexpr=HTMLFolds()

  autocmd FileType javascript,typescript,json,go,rust,ruby setl foldmethod=syntax

" }}}

" GitGutter ----------------------------------------------------------------{{{

  let g:gitgutter_enabled = 1

  let g:gitgutter_sign_added = '▎'
  let g:gitgutter_sign_modified = '▎'
  let g:gitgutter_sign_removed = '▏'
  let g:gitgutter_sign_removed_first_line = '▔'
  let g:gitgutter_sign_modified_removed = '▋'

  highlight clear SignColumn
  highlight! GitGutterAdd ctermfg=darkgreen guifg=darkgreen
  highlight! GitGutterChange ctermfg=yellow guifg=yellow
  highlight! GitGutterDelete ctermfg=darkred guifg=darkred
  highlight! GitGutterChangeDelete ctermfg=darkred guifg=darkred


  highlight GitGutterAdd ctermfg=green
  highlight GitGutterChange ctermfg=yellow
  highlight GitGutterDelete ctermfg=red
  highlight GitGutterChangeDelete ctermfg=yellow

  " }}}

" NeoMake ------------------------------------------------------------------{{{

  " dont open error window
  let g:neomake_open_list = 0

  " When reading a buffer (after 1s), and when writing.
  call neomake#configure#automake('rw', 1000)

  " Neomake 'Makers'
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_go_enabled_makers = ['go']
  let g:neomake_ruby_enabled_makers = ['rubocop']
  let g:neomake_warning_sign = {'text': '? '}
  let g:neomake_error_sign = {'text': '! '}

  hi NeomakeErrorSign ctermfg=red
  hi NeomakeWarningSign ctermfg=yellow

"  }}}

" Polyglot -----------------------------------------------------------------{{{

  let g:polyglot_disabled = ['javascript', 'json', 'jsx']

" }}}

" Close-Tag ----------------------------------------------------------------{{{

  let g:closetag_filenames = '*.html,*.jsx,*.js,*.html.erb'

"}}}

" Expand Region ------------------------------------------------------------{{{

  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)

" }}}

" Maximizer ----------------------------------------------------------------{{{

  nnoremap <Leader><Space> :MaximizerToggle!<CR>

"  }}}

" Easy Motion --------------------------------------------------------------{{{

  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1
  let g:EasyMotion_do_mapping = 0
  let g:EasyMotion_prompt = '→ → →'
  nmap ss <Plug>(easymotion-s2)
  nmap sd <Plug>(easymotion-s)
  nmap sf <Plug>(easymotion-overwin-f)
  map  sh <Plug>(easymotion-linebackward)
  map  sl <Plug>(easymotion-lineforward)
  map  s/ <Plug>(easymotion-sn)
  omap s/ <Plug>(easymotion-tn)
  map  sn <Plug>(easymotion-next)
  map  sp <Plug>(easymotion-prev)

" }}}

" TMUX Navigator --------------------------------------------------------------{{{

  let g:tmux_navigator_disable_when_zoomed = 1                 " Disable tmux navigator when zooming the Vim pane

" }}}

" Set_italics function -----------------------------------------------------{{{

  function! Set_italics()

    hi htmlArg gui=italic
    hi Comment gui=italic
    hi Type    gui=italic

    hi htmlArg cterm=italic
    hi Comment cterm=italic
    hi Type    cterm=italic

  endfunction

  nnoremap <silent><Leader>b :<C-u>call <SID>toggle_background()<CR>

  function! s:toggle_background()
    if ! exists('g:colors_name')
      echomsg 'No colorscheme set'
      return
    endif
    let l:scheme = g:colors_name

    if l:scheme =~# 'dark' || l:scheme =~# 'light'
      " Rotate between different theme backgrounds
      execute 'colorscheme' (l:scheme =~# 'dark'
            \ ? substitute(l:scheme, 'dark', 'light', '')
            \ : substitute(l:scheme, 'light', 'dark', ''))
    else
      execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
      if ! exists('g:colors_name')
        execute 'colorscheme' l:scheme
        echomsg 'The colorscheme `'.l:scheme
              \ .'` doesn''t have background variants!'
      else
        echo 'Set colorscheme to '.&background.' mode'
      endif
    endif
    call Set_italics()
  endfunction

  call Set_italics()

" }}}

" IndentGuides -------------------------------------------------------------{{{

  let g:indent_guides_color_change_percent = 1
  let g:indent_guides_guide_size = 1
  let g:indent_guides_start_level = 2
  let g:indent_guides_enable_on_vim_startup = 1

"  }}}

" fzf (https://github.com/junegunn/fzf#as-vim-plugin)-----------------------{{{

  " set run time path of fzf install
  set rtp+=/usr/local/opt/fzf

  " enable <C-n>/<C-p> as tab thru previous fzf sessions
  let g:fzf_history_dir = '~/.local/share/fzf-history'

  nnoremap <LocalLeader>ff   :FZF<space>
  " Fuzzy Find current file directory
  nnoremap <LocalLeader>F    :Files<c-r>=fnameescape(expand('%:p:h'))<cr>/<cr>
  " Fuzzy Find current working directory
  nnoremap <LocalLeader>f    :Files<cr>
  nnoremap <LocalLeader>g    :Rg<cr>
  " Search under cursor
  nnoremap <LocalLeader><bs>  :Rg <C-R><C-W><CR>

  nnoremap <LocalLeader>m    :Marks<cr>
  nnoremap <LocalLeader>w    :Windows<cr>
  nnoremap <LocalLeader>b    :Buffers<cr>
  nnoremap <LocalLeader>L    :Lines<cr>
  nnoremap <LocalLeader>l    :BLines<cr>
  nnoremap <LocalLeader>t    :Tags<cr>
  nnoremap <LocalLeader>h    :Helptags<cr>
  " old files / open Buffers
  nnoremap <LocalLeader>r    :History<cr>
  " command history
  nnoremap <LocalLeader>R    :History:<cr>
  " search history
  nnoremap <LocalLeader>/    :History/<cr>
  " Git
  nnoremap <LocalLeader>gg   :GFiles<cr>
  nnoremap <LocalLeader>G    :GFiles?<cr>
  nnoremap <LocalLeader>cc   :Commits<cr>
  " system
  nnoremap <LocalLeader>C    :Colors<cr>
  nnoremap <LocalLeader>c    :Commands<cr>
  " remove status line for FZF sessions
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
        \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)
  imap <c-x><c-t> <plug>(fzf-complete-buffer-line)

" }}}
