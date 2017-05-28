set nocompatible              " be iMproved, required
filetype off                  " required

syntax enable
set background=dark
colorscheme solarized

set tabstop=4
set shiftwidth=4
set nowrap
set splitright
set splitbelow
"set autoread

set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
set laststatus=2

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" integrated file explorer
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" autocomplete pairs such as (), [] and {}
Plugin 'jiangmiao/auto-pairs'

" work with surroundings (brackets, tags, parentheses)
Plugin 'tpope/vim-surround'

" syntax checker for lots of languages
Plugin 'vim-syntastic/syntastic'

" fuzzy file searcher
Plugin 'ctrlpvim/ctrlp.vim'

" auto completer
Plugin 'Valloric/YouCompleteMe'

" show git line status in gutter
Plugin 'airblade/vim-gitgutter'

" php specific auto completer
"Plugin 'shawncplus/phpcomplete.vim'

" language packs (highlighting and indentation)
Plugin 'sheerun/vim-polyglot'

" auto save on return from insert mode
"Plugin 'vim-scripts/vim-auto-save'

" auto close html tags
Plugin 'alvan/vim-closetag'

" automatic tag generation
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim autosave settings
"let g:auto_save = 1
"let g:auto_save_in_insert_mode = 0
"let g:auto_save_silent = 1

" fix blade filetype recognition
au BufNewFile,BufRead *.blade.php set filetype=blade

" html closetag extensions
let g:closetag_filenames = "*.htm,*.html,*.php,*.blade.php"

" easytags settings
let g:easytags_async = 1
let g:easytags_dynamic_tags_files = 2

" ctrlp settings
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1

" close vim if NERDTree is only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" nerdtree shortcut
map <C-e> :NERDTreeToggle<CR>

