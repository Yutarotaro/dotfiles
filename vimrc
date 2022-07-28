"airline-customization neovim
if has('nvim')
  set runtimepath^=~/.vim
  let &packpath = &runtimepath
endif

function! s:clang_format()
  let now_line = line(".")
  exec ":%! clang-format"
  exec ":" . now_line
endfunction

if executable('clang-format')
  augroup cpp_clang_format
    autocmd!
    autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
  augroup END
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/promptline.vim'
Plug 'itchyny/landscape.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim'
Plug 'jacquesbh/vim-showmarks'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'skanehira/preview-markdown.vim'
Plug 'MichaelMure/mdr'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'darrikonn/vim-gofmt', { 'do': ':GoUpdateBinaries' }
Plug 'maksimr/vim-jsbeautify'
Plug 'othree/yajs.vim'
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'tyru/caw.vim'
Plug 'rust-lang/rust.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-denops/denops.vim'
Plug 'vim-denops/denops-helloworld.vim'
Plug 'jonathanfilip/vim-lucius'
call plug#end()

" basics
runtime! user/sets.vim

" key mappings
runtime! user/keymaps.vim

" language-specific settings
runtime! user/filetype.vim

" list of plugins
runtime! user/plugins.vim

" plugin-specific settings
runtime! user/plugins/*.vim

" macvim
if has('gui_macvim')
  set guifont=SauceCodePowerline-Semibold:h13
  set antialias
endif

" colorscheme
" ----------

"colorscheme Molokai
colorscheme codedark
"colorscheme lucius
"set background=dark
syntax on
hi CursorLine cterm=underline,bold ctermfg=NONE ctermbg=NONE
set cursorline

map ; :

"airlinetheme

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:promptline_theme = 'airline'
"let g:airline_right_sep = ''
"let g:airline_left_sep = ''
let g:airline_theme='google_dark'

let g:airline_linecolumn_prefix = ''
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#readonly#enabled = 0
let g:airline_section_c = ''
let g:airline_section_z = ''

let g:airline_section_b =
\ '%{airline#extensions#branch#get_head()}' .
\ '%{""!=airline#extensions#branch#get_head()?("  " . g:airline_left_alt_sep . " "):""}' .
\ '%t%( %M%)'
set number
set tabstop=4
set shiftwidth=2

let g:showmarks_marks = "a"

"Nerd
let g:webdevicons_enable_nerdtree = 1

let g:indent_guides_enable_on_vim_startup = 1



highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

"rust.vim
let g:rustfmt_autosave = 1

let g:preview_markdown_parser = "mdr"

command! Jqf %!jq '.'
