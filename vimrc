" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

filetype off                  " required

" Set the runtime path to include fzf
set rtp+=/usr/local/opt/fzf

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'kien/ctrlp.vim'
  Plugin 'rking/ag.vim'
  Plugin 'tpope/vim-surround'
  Plugin 'scrooloose/nerdtree'
  Plugin 'preservim/nerdcommenter'
  Plugin 'ryanoasis/vim-devicons'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'scrooloose/syntastic'
  Plugin 'sjl/gundo.vim'
  Plugin 'airblade/vim-gitgutter.git'
  Plugin 'ervandew/supertab'
  Plugin 'fatih/vim-go'
  Plugin 'wakatime/vim-wakatime'
  Plugin 'tpope/vim-rhubarb'
  Plugin 'vim-test/vim-test'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
  Plugin 'tpope/vim-sleuth'
  Plugin 'junegunn/limelight.vim'

  " Themes
  Plugin 'jacoborus/tender'
  Plugin 'lucasprag/simpleblack'
  Plugin 'flrnd/candid.vim'
call vundle#end()

filetype plugin indent on


" General
syntax on " Switch syntax highlighting on

let mapleader = "," " Map leader
inoremap ,, <Esc>
tnoremap <Esc> <C-\><C-n>

" set foldmethod=syntax "syntax highlighting items specify folds
set foldmethod=indent
set foldcolumn=2 "defines 1 col at window left, to indicate folding
set foldlevelstart=99 "start file with all folds opened
" let javaScript_fold=1 "activate folding by JS syntax
inoremap <C-f> <C-O>za
nnoremap <C-f> za
onoremap <C-f> <C-C>za
vnoremap <C-f> zf

set t_Co=256
colorscheme tender
" colorscheme wombat
" colorscheme candid
" colorscheme simpleblack
set encoding=UTF-8

set backspace=indent,eol,start " Make backspace behave in a sane manner.

set number " Show line numbers

set clipboard=unnamed " Use OS clipboard for copypasta

set hidden " Allow hidden buffers, don't limit to 1 file per window/split

" set wildmode=longest,list,full " Bash-style tab completion
set wildmode=longest:full,full
set wildmenu

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2> "Paste MODE

set laststatus=2 " Show statusline
set showcmd " Show last command

set ignorecase " Case-insensitive search

set hlsearch " Highlight search results

set noexpandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)
autocmd FileType make set ts=2 " Set tab to 2 spaces for makefiles
autocmd FileType mkd set sw=4 " markdown
autocmd FileType mkd set sts=4 " markdown
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.cql set filetype=cql

set noerrorbells " Disable bells
set novisualbell " Disable bells
autocmd! GUIEnter * set vb t_vb=

set showmatch " show the matching bracket when inserting

set cpoptions+=ces$ " make the 'cw' and like commands put a $ at the end

set wildignore+=*.o,*.a,*.pyc,*.git,*.svn,*.sw*,*.d

:highlight ExtraWhitespace ctermbg=red guibg=red " Show trailing spaces
:match ExtraWhitespace /\s\+$/ " Show trailing spaces

set colorcolumn=80 " Column 80 marker - Limit 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929 
match OverLength /\%81v.\+/

set list listchars=tab:» ,nbsp:•,trail:·,extends:»,precedes:«
" show tab and space characters
nmap <silent> <leader><tab> :set nolist!<CR> " Toggle invisible characters with leader-tab

function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

map <silent> <F3> :call TrimWhiteSpace()<CR>

nmap r :redo<CR>
nmap u :undo<CR>

" NeoVim Integrated terminal
set splitbelow
tnoremap <Esc> <C-\><C-n>
au BufEnter * if &buftype == 'terminal' | :startinsert | endif " start terminal in insert mode

function! OpenTerminal()
  split term://zsh
  resize 10
endfunction

nnoremap <C-s> :call OpenTerminal()<CR>
" use alt+hjkl to move between split/vsplit panels
" tnoremap <C-h> <C-\><C-n><C-w>h
" tnoremap <C-j> <C-\><C-n><C-w>j
" tnoremap <C-k> <C-\><C-n><C-w>k
" tnoremap <C-l> <C-\><C-n><C-w>l
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l


" Fzf
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_nvim_statusline = 0
"function! s:fzf_statusline()
"  " Override statusline as you like
"  highlight fzf1 ctermfg=161 ctermbg=251
"  highlight fzf2 ctermfg=23 ctermbg=251
"  highlight fzf3 ctermfg=237 ctermbg=251
"  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
"endfunction
"autocmd! User FzfStatusLine call <SID>fzf_statusline()
" nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <leader>sf :Files<CR>
nnoremap <silent> <leader>sb :Buffers<CR>
nnoremap <silent> <leader>sr :Rg<CR>
nnoremap <silent> <leader>sl :BLines<CR>
nnoremap <silent> <leader>sc :Commits<CR>
nnoremap <silent> <leader>st :Helptags<CR>
nnoremap <silent> <leader>sh :History:<CR>
" nnoremap <silent> <leader>sh/ :History/<CR> 
autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler


"NerdTree
map <c-n> :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
autocmd vimenter * NERDTree | wincmd p
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 42
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules/']
let g:NERDTreeStatusline = ''
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " Close if last tab
" autocmd FileType nerdtree let b:NERDTreeZoomed = 1
" autocmd BufEnter NERD_tree_* normal A
" autocmd BufLeave NERD_tree_* normal A
function NERDTreeMaximize()    
  if !exists("b:NERDTreeZoomed") || !b:NERDTreeZoomed    
    call NERDTreeMaximizeToggle()
  endif
endfunction

function NERDTreeMinimize()
  if exists("b:NERDTreeZoomed") && b:NERDTreeZoomed
    call NERDTreeMaximizeToggle()
    normal <C-w>=<CR>
  endif
endfunction

function NERDTreeMaximizeToggle()
  call b:NERDTree.ui.toggleZoom()
endfunction

augroup vimrc_nerdtree
  autocmd BufEnter NERD_tree_* :call NERDTreeMaximize()
  autocmd BufLeave NERD_tree_* :call NERDTreeMinimize()
augroup END


"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0
" let g:airline_theme='wombat'


" Control-P
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Search
nnoremap <space><space> :Ag<space>


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let cwd = getcwd()

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_scss_checkers = ['scss_lint']
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_go_checkers = ['golint', 'govet', 'golangci-lint']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:syntastic_enable_signs          = 1
let g:syntastic_enable_highlighting   = 1
let g:syntastic_cpp_check_header      = 1
let g:syntastic_enable_balloons       = 1
let g:syntastic_echo_current_error    = 1
let g:syntastic_check_on_wq           = 0
let g:syntastic_error_symbol          = '✘'
let g:syntastic_warning_symbol        = '!'
let g:syntastic_style_error_symbol    = ':('
let g:syntastic_style_warning_symbol  = ':('
let g:syntastic_vim_checkers          = ['vint']
let g:syntastic_elixir_checkers       = ['elixir']
let g:syntastic_python_checkers       = ['flake8']
let g:syntastic_javascript_checkers   = ['eslint']

let b:syntastic_scss_scss_lint_args = '--config ~/Wootric/lotus/.scss-lint.yml'


"Gitgutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
" let g:gitgutter_highlight_lines = 1


"Supertab
set completeopt=longest,menuone
" let g:SuperTabDefaultCompletionType = "<C-t>" "This fucks up indentation
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>


"Gundo
nnoremap <F5> :GundoToggle<CR>


"LimeLight
let g:limelight_default_coefficient = 0.7
let g:limelight_conceal_ctermfg = 238
nmap <C-l><C-l> :Limelight!!<CR>
" nmap <silent> gl :Limelight!!<CR>
" xmap gl <Plug>(Limelight)
autocmd VimEnter * Limelight


"Vim-go
let g:go_version_warning = 1
let g:go_jump_to_error = 1
let g:go_fmt_command = "goimports"
" let g:go_fmt_command = "gofmt"
let g:go_list_type = "locationlist"
let g:go_decls_mode = 'ctrlp.vim'
let g:go_echo_command_info = 0


"vim-test
function Test_SetTypescriptExec()
  " let g:test#javascript#jest#executable = 'npm run fe:tsc && npx jest --config jest/jest.config.js'
  let g:test#javascript#jest#executable = 'NODE_ENV=testing npx mocha $MOCHA_OPTS --require test/setup.js --require @babel/register --require ignore-styles --file test/init.js'
endfunction

function Test_SetJavascriptExec()
  "let g:test#javascript#jest#executable = 'npx jest'
  let g:test#javascript#mocha#executable = 'NODE_ENV=testing npx mocha $MOCHA_OPTS --require test/setup.js --require @babel/register --require ignore-styles --file test/init.js'
endfunction

" let g:test#preserve_screen = 1
augroup test
  autocmd BufEnter *.test.tsx :call Test_SetTypescriptExec()
  autocmd BufEnter *.test.js :call Test_SetJavascriptExec()
augroup END

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" syntax on
" colorscheme tender
