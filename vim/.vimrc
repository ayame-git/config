set nocp
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"vim
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'yegappan/grep'
Plugin 'Yggdroot/indentLine'
Plugin 'DoxygenToolkit.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'oblitum/rainbow'
Plugin 'junegunn/vim-easy-align'

"c++
Plugin 'a.vim'
Plugin 'drmikehenry/vim-headerguard'
Plugin 'vim-jp/vim-cpp'
Plugin 'octol/vim-cpp-enhanced-highlight'

"go
Plugin 'fatih/vim-go'

"python
Plugin 'davidhalter/jedi' "auto complete

"json
Plugin 'elzr/vim-json'

"color schemes
Plugin 'chriskempson/base16-vim'

call vundle#end()
filetype indent plugin on

set hidden
set incsearch "looks for match without enter
set hlsearch  "highlights match
set ignorecase
set smartcase
set backspace=indent,eol,start "backspace will delete new line breaks etc.
set nostartofline
set ls=2
set confirm
set noerrorbells
set visualbell
set t_vb=
set mouse=a
set cmdheight=1
set number
set completeopt=menuone
set tw=80
set wrap
set linebreak
set expandtab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set encoding=utf-8

"colors
syntax on
set t_Co=256
let base16colorspace=256
colorscheme base16-default-dark
"set background=dark
set cursorline
"let g:haskell_classic_highlighting = 1

"vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"rainbow
let g:rainbow_active = 1

"maps and hotkeys

map <silent> <F2> :NERDTreeToggle \| :NERDTreeMirror<CR>

"movesyAlignip tabssyAlign
nnoremap <silent><S-h> :tabmove -1<CR>
nnoremap <silent><S-l> :tabmove +1<CR>

"switch tabs 
nnoremap <silent><C-h> :tabp<CR>
nnoremap <silent><C-l> :tabn<CR>

"swtich splits
nnoremap <silent><A-h> :wincmd h<CR>
nnoremap <silent><A-j> :wincmd j<CR>
nnoremap <silent><A-k> :wincmd k<CR>
nnoremap <silent><A-l> :wincmd l<CR>

noremap  <silent><C-n> :nohl<CR>
inoremap <silent><C-n> <C-o>:nohl<CR>

noremap <silent><C-s> :update<CR> "save current buffer
noremap <silent><S-s> :wa<CR>     "write all buffers

let g:ulti_expand_or_jump_res = 0
function! CRCompleteFunc()
  let snippet = UltiSnips#ExpandSnippet()
  if g:ulti_expand_res > 0
    return snippet
  endif
  return "\<CR>"
endfunction

inoremap <expr><Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><Down>  pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr><S-Tab> pumvisible() ? "\<C-p>" : "<Plug>delimitMateS-Tab"
inoremap <expr><Up>    pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
imap     <expr><CR>    pumvisible() ? "<C-r>=CRCompleteFunc()<CR>" : "<Plug>delimitMateCR"

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_server_use_vim_stdout = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsEditSplit = 'vertical'

let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

let g:airline_theme = 'bubblegum'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:syntastic_stl_format = ''
"let g:syntastic_c_auto_refresh_includes = 1
"let g:syntastic_cpp_no_include_search = 1
"let g:syntastic_debug = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libc++'

let NERDTreeShowHidden = 1

let g:indentLine_char = '┆'
let g:indentLine_bufNameExclude = [ 'NERD_tree.*' ]
let g:indentLine_noConcealCursor = 1

"extension highlight
autocmd BufNewFile,BufRead *.django set filetype=html
autocmd BufNewFile,BufRead *.asm set filetype=nasm

"au FileType c,cpp call rainbow#load()
au FileType coffee,html,python,ruby,sh,xml setl shiftwidth=2 softtabstop=2 tabstop=2
highlight Pmenu ctermfg=white ctermbg=darkblue guifg=green guibg=blue
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!
