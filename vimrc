" Plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'benmills/vimux'
Plugin 'keith/swift.vim'
Plugin 'w0rp/ale'
Plugin 'maralla/completor.vim'
"Plugin 'zxqfl/tabnine-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'atelierbram/Base2Tone-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'

call vundle#end()            " required
filetype plugin indent on    " required

" Basic Setup
syntax on
let g:airline_theme='nord'

colorscheme nord

set smartindent
set shiftwidth=2
set tabstop=2
set expandtab
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

set backupdir=/tmp//

set mouse=a
set laststatus=2
set showtabline=2

let g:tmux_navigator_save_on_switch = 2

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxInterruptRunner<CR>:sleep 50m<CR>:VimuxRunLastCommand<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
    " If completor is already open the `tab` cycles through suggested completions.
    if pumvisible()
        return "\<C-N>"
        " If completor is not open and we are in the middle of typing a word then
        " `tab` opens completor menu.
    elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-R>=completor#do('complete')\<CR>"
    else
        " If we aren't typing a word and we press `tab` simply do the normal `tab`
        " action.
        return "\<Tab>"
    endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 1

let g:completor_clang_binary = '/usr/bin/clang'
let g:completor_python_binary = '/usr/local/bin/python'
let g:completor_node_binary = '/usr/local/bin/node'
let g:completor_gocode_binary = '/Users/tdubey/clearstreet/fleet/bin/gocode'

