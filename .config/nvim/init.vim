" Initial Settings
set noswapfile
set shell=/usr/local/bin/zsh
set background=dark
set termguicolors
set clipboard=unnamed
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set nu

" vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'edkolev/tmuxline.vim' " tmuxline bar
Plug 'vim-airline/vim-airline' " airline bar
Plug 'christoomey/vim-tmux-navigator' " better tmux intergration
Plug 'scrooloose/nerdtree' " nerdtree file navigation
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'dracula/vim'
Plug 'nathanaelkane/vim-indent-guides' " indent guides
Plug 'ntpeters/vim-better-whitespace' " clean up whitespace
Plug 'Lokaltog/vim-easymotion' " move quickly through files
Plug 'airblade/vim-gitgutter' " git status in gutter
Plug 'kien/ctrlp.vim' " fuzzy search
Plug 'rking/ag.vim' " the_silver_searcher for ctrlp
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'dbakker/vim-lint'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/syntastic'
Plug 'leafgarland/typescript-vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mhinz/vim-startify'
call plug#end()

colorscheme dracula

" Text Formatting
syntax enable " syntax highlighting
filetype plugin indent on " load file type plugins
set autoindent " automatic indent new lines
set smartindent			" be smart about it
set nowrap " do not wrap lines
set tabstop=2 " set tab equivilant to 4 spaces
set shiftwidth=2
set softtabstop=2 " soft tabs
set virtualedit=block

" Visual Cues
set showmatch
set mat=5
set incsearch
set ignorecase
set nohlsearch
set visualbell

" Remapping
let mapleader = "," " lead with ,
inoremap jj <ESC> " exit to normal mode with 'jj'
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" split remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nnoremap bl :bnext<CR>

" Move to the previous buffer
nnoremap bh :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nnoremap bq :bp <BAR> bd #<CR>

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

" split remapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-T> :TagbarToggle<CR>

" AG
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0


  nmap <leader>bb :CtrlPBuffer<cr>
endif
  nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
  nnoremap \ :Ag<SPACE>
  let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
  if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'dracula'
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

"	NERDTree
" ===========================================================
  let g:NERDTreeWinSize = 40
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=0
  map <Leader>n :NERDTreeTabsToggle<CR>
  map <Leader>sw :StripWhitespace<CR>
  map <Leader>w :wa<CR>
  map <Leader>wq :wqa<CR>

" EasyMotion
" ===========================================================
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  nmap s <Plug>(easymotion-s)
  let g:EasyMotion_smartcase = 1
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  map <Leader> <Plug>(easymotion-prefix)

" Vim Tmux Navigation
" ===========================================================
  if exists('$TMUX')
    function! TmuxOrSplitSwitch(wincmd, tmuxdir)
      let previous_winnr = winnr()
      silent! execute "wincmd " . a:wincmd
      if previous_winnr == winnr()
        call system("tmux select-pane -" . a:tmuxdir)
        redraw!
      endif
    endfunction

    let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
    let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
    let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

    nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
    nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
    nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
    nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>:redraw!<cr>
  else
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
  endif

" Syntastic
" ===========================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=0
let g:syntastic_auto_jump=0
let g:syntastic_json_checkers=['jsonlint', 'jsonval']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=0
let g:syntastic_echo_current_error=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_open = 0
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
nnoremap <silent> <C-e> :Errors<CR>

if has('nvim')
    au! TabNewEntered * Startify
endif
