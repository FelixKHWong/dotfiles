if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" git
Plug 'tpope/vim-fugitive' " git wrapper for vim

" visibility
Plug 'junegunn/limelight.vim' " status bar for vim
Plug 'RRethy/vim-illuminate' " illuminate current word
Plug 'octol/vim-cpp-enhanced-highlight' " cpp text highlight
Plug 'itchyny/lightline.vim' " status bar
Plug 'preservim/nerdtree' " file system

"productivity
Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'junegunn/fzf', {'do':{->fzf#install()}}
Plug 'mrtazz/DoxygenToolkit.vim' " easy doxygen comments
Plug 'terryma/vim-multiple-cursors' " multiple line editing
Plug 'ycm-core/YouCompleteMe' " auto complete and more
Plug 'dense-analysis/ale' "linter

"colorschemes
Plug 'sainnhe/forest-night' " forest night background
Plug 'tlhr/anderson.vim' "andersond color scheme
Plug 'gmoe/vim-espresso' "espresso color scheme

call plug#end()

set number
set laststatus=2
set wrap
colorscheme forest-night

"lightline configs
let g:lightline = { 
 \ 'colorscheme':'seoul256',
 \}

" cpp highlight config
let g:cpp_class_scope_highlight = 1 

"ale config
let g:ale_lint_on_enter = 1 
let g:ale_lint_on_save = 1 
let g:ale_linters = {'cpp':['clang']}

"mappings
let mapleader = "\<Space>"

map <C-n> :NERDTreeToggle<CR>
~                                                                                                                                                                                                               
~                                                                                                                                                                                                               
~                                             
