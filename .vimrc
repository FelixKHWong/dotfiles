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
Plug 'mhinz/vim-startify' "nice start screen

"productivity
Plug 'junegunn/fzf.vim' " fuzzy search
Plug 'junegunn/fzf', {'do':{->fzf#install()}}
Plug 'mrtazz/DoxygenToolkit.vim' " easy doxygen comments
Plug 'terryma/vim-multiple-cursors' " multiple line editing
Plug 'ycm-core/YouCompleteMe' " auto complete and more
Plug 'dense-analysis/ale' "linter
Plug 'justinmk/vim-dirvish' "file searcher

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
let g:ale_linters = {'cpp':['clangtidy'], 'c':['clandtidy', 'pclint']}

" ycm configs
let g:ycm_clangd_args = ['-log=verbose', '--pretty', '--background-index', '--completion-style=detailed']

"mappings
let mapleader = "\<Space>"

nnoremap <leader>z :Files<CR>
nnoremap <leader><Tab> :Buffers<CR>
nnoremap <leader>ag :Ag<space>

" Key mappings for clang-format, to format source code.
" map <expr> allows expansion of the variable for the
" clang path.
map <expr> <leader>f ":py3f " . g:clang_path . "/share/clang/clang-format.py<CR>"

" Turn off prompting to load .ycm_extra_conf.py
let g:ycm_confirm_extra_conf = 0
nnoremap <leader>y :YcmCompleter<Space>
nnoremap <S-F12> :YcmCompleter<space>GoToReferences<CR>
nnoremap <F12> :YcmCompleter<space>GoTo<CR>


" Startify options
" Set startify to not switch directories when
" opening a file. This lets us stay in the directory
" we opened the editor in:
let g:startify_change_to_dir = 0
