" Original Author:      Bram Moolenaar <Bram@vim.org>
" Modified by:          Marin Alcaraz  <mailto@alcarazmar.in>
" Modified by:          Gerardo Reyes  <grevych@gmail.com>

"  If you don't understand a setting in here, just type ':h setting'.


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
  Plugin 'kien/rainbow_parentheses.vim.git'
  Plugin 'jacoborus/tender'
  Plugin 'wakatime/vim-wakatime'
  Plugin 'tpope/vim-rhubarb'
  Plugin 'vim-test/vim-test'
  Plugin 'junegunn/fzf'
  Plugin 'junegunn/fzf.vim'
call vundle#end()

filetype plugin indent on

 

"Folding
" set foldmethod=syntax "syntax highlighting items specify folds
set foldcolumn=2 "defines 1 col at window left, to indicate folding
" let javaScript_fold=1 "activate folding by JS syntax
set foldlevelstart=99 "start file with all folds opened



" Switch syntax highlighting on
syntax on

set t_Co=256
" set guicolors
" colorscheme wombat256
colorscheme tender
set encoding=UTF-8

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Show line numbers
set number

" Fix Delete (backspace) on Mac OS X
set backspace=2

" Use OS clipboard for copypasta
set clipboard=unnamed

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden

" Bash-style tab completion
set wildmode=longest,list
set wildmenu

"Paste MODE
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>



"Macvim
" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "Hide scrollbar
" set guifont=Meslo\ LG\ S\ for\ Powerline:h16



" Show statusline
set laststatus=2

" Case-insensitive search
set ignorecase

" Highlight search results
set hlsearch

" Default to soft tabs, 2 spaces
set autoindent
" set expandtab
set noexpandtab
set sw=2
set sts=2

" Map leader
let mapleader = ","

"Pretty Json
com! FormatJSON %!python -m json.tool

"Disable bells
set noerrorbells
set novisualbell
autocmd! GUIEnter * set vb t_vb=

" show the matching bracket when inserting
set showmatch

" make the 'cw' and like commands put a $ at the end
set cpoptions+=ces$

set wildignore+=*.o,*.a,*.pyc,*.git,*.svn,*.sw*,*.d

" Show trailing spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

set tabstop=4
" Except for Makefiles: Hard tabs of width 2
autocmd FileType make set ts=2
" And Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.cql set filetype=cql

" Column 80 marker
set colorcolumn=80

"Emmet
" let g:user_emmet_leader_key='<C-E>'

inoremap ,, <Esc>
tnoremap <Esc> <C-\><C-n>

"NerdTree
" map <F6> :NERDTreeToggle<CR>
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

"Limit 80 chars
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

"CLOSE NERDTREE WHEN LAST WINDOW
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" NeoVim Integrated terminal
set splitbelow
" turn terminal to normal mode with escape
" tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
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



"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:bufferline_echo = 0
set laststatus=2
" let g:airline_theme='wombat'

" Control-P Settings
let g:ctrlp_map = '<c-f>'
let g:ctrlp_working_path_mode = 'rc'
" map <leader>j :CtrlP<cr>
map <c-f> :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>

" map <leader>f :CtrlP<cr>
" map <leader>F :CtrlP %%<cr>
" map <C-f> :CtrlPBuffer<CR>
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" Whitespace settings
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

" show tab and space characters
set list listchars=tab:» ,nbsp:•,trail:·,extends:»,precedes:«

" Toggle invisible characters with leader-tab
" nmap <silent> <leader><tab> :set nolist!<CR>

" highlight trailing whitespace
highlight ExtraWhitespace ctermbg=lightgrey guibg=lightgrey ctermfg=red guifg=lightred
match ExtraWhitespace /\s\+$/

" Remove trailing whitespace with F3
map <silent> <F3> :call TrimWhiteSpace()<CR>``

" Use wildmenu
set wildmenu

" Set completion style
set wildmode=longest,list,full

" Ignore images
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.ico

" Ignore PSDs
set wildignore+=*.psd

" Ignore PID files
set wildignore+=*.pid

" Ignore files in tmp
set wildignore+=*/tmp/*

" Ignore sqlite databases
set wildignore+=*.sqlite3

" Ignore xcode files
set wildignore+=*.ipa,*.xcodeproj/*,*.xib,*.cer,*.icns

" Ignore asset pipeline
set wildignore+=public/assets/*,public/stylesheets/compiled/*

" Ignore vcr cassettes
set wildignore+=spec/vcr/*

" Ignore bundler files
set wildignore+=bundler_stubs/*

" Smart Tab completion
set completeopt=longest,menuone
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

" inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"Search
" Initiate search with <space><space>
nnoremap <space><space> :Ag<space>




" Fzf
" nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>f :Rg<CR>
" nnoremap <silent> <Leader>/ :BLines<CR>
" nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-r> :Rg<CR>
nnoremap <silent> <C-l> :BLines<CR>
nnoremap <silent> f<C-c> :Commits<CR>
nnoremap <silent> f<C-t> :Helptags<CR>
nnoremap <silent> f<C-h> :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR> 

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

let b:syntastic_scss_scss_lint_args = '--config ~/Wootric/lotus/.scss-lint.yml'


"Gitgutter
nmap <Leader>ha <Plug>GitGutterStageHunk
nmap <Leader>hu <Plug>GitGutterRevertHunk
let g:gitgutter_highlight_lines = 1

"Supertab
let g:SuperTabDefaultCompletionType = "<C-t>"

"Gundo
nnoremap <F5> :GundoToggle<CR>

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
  let g:test#javascript#jest#executable = 'npm run fe:tsc && npx jest --config jest/jest.config.js'
endfunction

function Test_SetJavascriptExec()
  let g:test#javascript#jest#executable = 'npx jest'
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

"Rainbow parens
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

syntax on
colorscheme tender
