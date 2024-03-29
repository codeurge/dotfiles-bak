" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \                                                                  
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif                                                                                                                                 
call plug#begin('~/.config/nvim/plugged') 
" Initial Settings
" ===========================================================
  set noswapfile      " Live dangerous, no swapfiles
  " set nocompatible    " Just say no to plain vi
  " update: not needed if using a personal vimrc
  set shell=/bin/sh    " Zsh.
  set encoding=utf-8    " UTF-8 encoding
  filetype off
  set background=dark " Dark background
  set t_Co=16			" 256 Terminal Colors
  set clipboard=unnamed " Use the OS X clipboard
  set ruler				" show the cursor position all the time
  set noshowcmd			" don't display incomplete commands
  set lazyredraw		" use lazyredraw
  set nu              " turn on line number
  set wildmenu			" turn on wild menu
  set wildmode=list:longest,full
  set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem " what files to ignore when doing filename completion, etc.
  set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz " Disable archive files
  set wildignore+=vendor/gems/*,vendor/cache/*,.bundle/*,.sass-cache/* " Ignore bundler and sass cache
  set wildignore+=node_modules/* " Ignore node_modules
  set wildignore+=*.swp,*~,._* " Disable temp and backup files
  set ch=1				" command line height
  set backspace=2 		" allow backspacing over everything in insert mode
  set report=0			" tell us about changes
  set nostartofline		" don't just to start of line when scrolling
  set autoread			" don't prompt if buffers have been saved prior to external modification.
  set splitbelow    " open splits below current pane
  set splitright    " open vertical splits to right of current pane
  set autoread
  set confirm
  set autowriteall
  set synmaxcol=200
  set ttyfast



  " Different cursors for different modes.
  set guicursor=n-c:block-Cursor-blinkon0
  set guicursor+=v:block-vCursor-blinkon0
  set guicursor+=i-ci:ver20-iCursor

" vim-plug
" ===========================================================
  call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'Lokaltog/vim-easymotion'
  Plug 'airblade/vim-gitgutter'
  Plug 'kien/ctrlp.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'edkolev/tmuxline.vim'
  Plug 'rking/ag.vim'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'djoshea/vim-autoread'
  Plug 'kshenoy/vim-signature'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-jade'
  Plug 'slim-template/vim-slim'
  Plug 'fatih/vim-go'
  Plug 'isRuslan/vim-es6'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'dbakker/vim-lint'
  Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'dracula/vim'
  Plug 'ConradIrwin/vim-bracketed-paste'
  Plug 'majutsushi/tagbar'
  Plug 'scrooloose/syntastic'
  call plug#end()
  colorscheme Dracula

"	Text Formatting
" ===========================================================
  syntax enable			" Enable syntax highlighting
  filetype plugin indent on " load file type plugins and indentation
  set autoindent			" automatic indent new lines
  set smartindent			" be smart about it
  set nowrap				" do not wrap lines
  set tabstop=2 			" set tab equivilant to 4 spaces
  set shiftwidth=2 		" ..
  set softtabstop=2   " soft tabs
  set expandtab
  set formatoptions+=n	" support for numbered lines/bullet lists
  set virtualedit=block	" allow virtual edit in visual block

"	Visual Cues
" ===========================================================
  set showmatch			" brackets/braces that is
  set mat=5				" duration to show matching brace (1/10 sec)
  set incsearch			" find as you type
  set laststatus=2		" always show the status line
  set ignorecase			" ignore case when searching
  set nohlsearch			" don't highlight searches
  set visualbell			" shut the fuck up

"	Remapping
" ===========================================================
  let mapleader = " " 	" lead with ,
  inoremap jj <ESC> 		" exit to normal mode with 'jj'

  " reflow paragraph with Q in normal and visual mode
  nnoremap Q gqap
  vnoremap Q gq

  " sane movement with wrap turned on
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

"	Strip all trailing whitespace in file
" ===========================================================
  let g:better_whitespace_filetypes_blacklist=['unite']

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

" HAMLC Support
" ===========================================================
au BufRead,BufNewFile *.hamlc set ft=haml " Add Syntax support for HAMLC

" AG
" ===========================================================
" The Silver Searcher
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
" ===========================================================
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

" CursorLine
" ===========================================================
" hi CursorLine   ctermbg=393939
nnoremap <Leader>c :set cursorline!<CR>
set cursorline!

" SLIM
" ===========================================================
autocmd BufNewFile,BufRead *.slim set ft=slim

" JSX
" ===========================================================
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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

" Airline
" ===========================================================
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tmuxline#enabled = 1
let g:tmuxline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
au BufNewFile,BufRead *.ejs set filetype=html

" add jbuilder syntax highlighting
au BufNewFile,BufRead *.json.jbuilder set ft=ruby

" Toggle (change option) clipboard (pasteboard) syncing on/off
nnoremap cc :set <C-R>=&clipboard =~# "unnamed" ? 'clipboard=' : 'clipboard=unnamed'<CR><CR>

let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.js,*.html.erb"
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}
