"autoload vimrc 
autocmd! bufwritepost .vimrc source %
set encoding=utf-8
" map f2 -redo command
map <F2> <c-r>
syntax on

" Show white spaces
" Must be inserted before colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" colorscheme
"colorscheme delek
" Enable syntax highlight 
filetype off
filetype plugin indent on 
syntax on

" Showing line numbers and length
set number
set tw=79		" whdth (used for gd) 
set nowrap		" don't auto wrap on load
set fo-=t		" don't auto. wrap test when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" History
set history=700
set undolevels=700

" Don't use TABS but spaces 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" ============================================================================
" Python IDE Setup
" ============================================================================
" Setup Pathogen to manage your plugins
" mkdir -p ~/.vim/autoload ~/.vim/bundle
" curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a  .vim/bundle/plugin-name folder ...
call pathogen#infect() 

" Plugin vim-powerline
" cd ~/.vim/bundle && git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2

" Plugin ctrlp.vim
" cd ~/.vim/bundle && git clone git://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: install modules sudo easy_install ipython && sudo easy_install ipdb
" Settings for jedi-vim
" cd ~/.vim/bundle && git clone git://github.com/davidhalter/jedi-vim.git
"let g:jedi#usages_command = "<leader>z"
"let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0

map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>



"Omnicompletion 
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
 set completeopt=longest,menuone
 function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
         elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
 endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" http://http://ethanschoonover.com/solarized/vim-colors-solarized
" vim-colors-solarized
" cd ~/.vim/bundle && 
" git clone git://github.com/altercation/vim-colors-solarized.git
" You should put solarized.vim in ~/.vim/colors/ !!!!!!!
" make link  
" cd ~/.vim/ && ln -s ~/.vim/bundle/vim-colors-solarized/colors
" or move it
" cd ~/.vim/bundle && mv vim-colors-solarized/* .

"This is set to 16 by default, meaning that Solarized will attempt to use the
"standard 16 colors of your terminal emulator. You will need to set those
"colors to the correct Solarized values either manually or by importing one of
"the many colorscheme available for popular terminal emulators and Xdefaults.
let g:solarized_termcolors=256
" If you use a terminal emulator with a transparent background and Solarized
" isn’t displaying the background color transparently, set this to 1 and
" Solarized will use the default (transparent) background of the terminal
" emulator. urxvt required this in my testing; iTerm2 did not.
let g:solarized_termtrans =1 
syntax enable
set background=dark
"set background=light
colorscheme solarized



" disable history of browsing 
" http://stackoverflow.com/questions/9850360/what-is-netrwhist
let g:netrw_dirhistmax = 0
