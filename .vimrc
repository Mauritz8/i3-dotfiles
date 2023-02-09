set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'


" syntax highlighting
" Plugin 'vim-python/python-syntax'
Plugin 'dart-lang/dart-vim-plugin'
" Plugin 'xavierd/clang_complete'

" colorschemes
Plugin 'dracula/vim'
Plugin 'morhetz/gruvbox'
Plugin 'wadackel/vim-dogrun'
Plugin 'embark-theme/vim', {'name': 'embark' }
Plugin 'drewtempelmeyer/palenight.vim'
Plugin 'catppuccin/vim', {'name': 'catppuccin'}


" better statusbar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'


" find files with ctrl-p
Plugin 'kien/ctrlp.vim'

" work with git in vim
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" file system navigation and multiple tabs open
Plugin 'preservim/nerdtree'


" automatically close parenthesis
Plugin 'Raimondi/delimitMate'

" autocompletion
Plugin 'lifepillar/vim-mucomplete'


call vundle#end()            " required
filetype plugin indent on    " required




set number
set relativenumber
syntax on


" make searching in file better (/ and ?)
set incsearch " incrementally search while typing
set ignorecase "case insensitive
set smartcase " use smart case for searching
set hlsearch " highlight searches

set tabstop=4 " tabs are 4 spaces

set autoindent " automatically indent
set smartindent " smart indent, for example add indent after {
set t_vb= " remove visual bell and beep on error
set shiftwidth=4
set expandtab " convert tabs to spaces




" set leader to space
let mapleader = " "

" map jj to escape in insert mode
inoremap jj <esc>


" j and k moves by visual line (doesn't skip long text that's more than 1 line visually)
nmap j gj
nmap k gk

" map leader + w to save file
nmap <leader>w :w<cr>

" run file with F9
nnoremap <F9> :call RunFile() <CR>
function! RunFile()
	exec ":w"
	if &filetype == "java"
		exec ":! cd %:p:h && javac %:t && java %:t:r"
	elseif &filetype == "python"
		exec ":! python %"
	elseif &filetype == "haskell"
		exec ":! runhaskell %"
    elseif &filetype == "C"
        exec "! cd %:p:h && gcc %:t -o %:r && ./%:t:r"
	endif
endfunction



" change panes with ctrl hjkl instead of ctrl-w hjkl
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l




" ------- different colorschemes and their settings ----------------
" colorscheme dracula
" colorscheme dogrun
" colorscheme embark
" colorscheme gruvbox
" colorscheme palenight
colorscheme catppuccin_mocha
set background=dark
set termguicolors

if (has("termguicolors"))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  	set termguicolors
endif

set t_ut=""
if (&term =~ '^xterm' && &t_Co == 256)
        set t_ut= | set ttyscroll=1
endif

" hi TabLine ctermfg=DarkGrey ctermbg=Black cterm=NONE
" hi TabLineSel ctermfg=Magenta ctermbg=Black cterm=NONE
" hi TabLineFill ctermfg=Black



" tokyo night colorscheme
let g:tokyonight_style = 'storm' " available: night, storm
let g:tokyonight_enable_italic = 1

" ------------- vim-arline settings -----------
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" ----------- git-gutter settings -------------
let g:gitgutter_async=0
let g:gitgutter_terminal_reports_focus=0
set updatetime=100



" ----- delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
        au!
        au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
        au FileType tex let b:delimitMate_quotes = ""
        au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
        au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END


" ------------- ctrl-p settings --------------
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
                \ --ignore .git
                \ --ignore .svn
                \ --ignore .hg
                \ --ignore .DS_Store
                \ --ignore "**/*.pyc"
                \ -g ""'
let g:ctrlp_clear_cache_on_exit = 0



" ------------- vim-mucomplete settings -------------------
set completeopt+=menuone
set completeopt+=noselect
set belloff+=ctrlg " If Vim beeps during completion"
set shortmess+=c   " Shut off completion messages
let g:mucomplete#enable_auto_at_startup = 1


" python syntax highlighting (plugin vim-python/python-syntax)
" let g:python_highlight_all = 1


" ----------------- nerdtree settings -----------------
let NERDTreeShowLineNumbers=1 " enable line numbers
autocmd FileType nerdtree setlocal relativenumber " make sure relative line numbers are used
" maps leader + n to toggle nerdtree
nmap <leader>n :NERDTreeToggle<cr>
