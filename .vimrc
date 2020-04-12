"autoload vimrc 
autocmd! bufwritepost .vimrc source %
set encoding=utf-8
" map f2 -redo command
nmap <F2> :update!<CR>
imap <F2> <C-O>:update!<CR>
" move between tabs vim keys  тест на бг-то
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tn  :tabnew 

" SpellCheck
set spell


" Stop running in vi-compatible mode.
set nocompatible

" Enable syntax highlight
filetype off 
filetype plugin indent on
syntax enable

" disable bell
set visualbell
"set t_vb=

" History
set history=700
set undolevels=700

" Don't use TABS but spaces 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" https://www.youtube.com/watch?v=XA2WjJbmmoM
" Vim wihout plugins
" Search down into the folders
set path+=**
" Display all matching files when tab complete
set wildmenu

" Showing line numbers and length
set nu
set tw=79		" whdth (used for gd) 
"set nowrap		" don't auto wrap on load
"set fo-=t		" don't auto. wrap test when typing
set colorcolumn=80
highlight ColorColumn ctermbg=LightGreen

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'altercation/vim-colors-solarized', { 'set': 'all' }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" syntastic or vim-flake8
Plug 'vim-syntastic/syntastic'
"
" Airline is deprecated.. new stuff is powerline 
" Plug 'vim-airline/vim-airline'
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

Plug 'Valloric/YouCompleteMe'

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
" Plug 'vim-scripts/Conque-GDB'
" Initialize plugin system

" Java Script Plugins
" Plug 'jelera/vim-javascript-syntax'
" Plug 'marijnh/tern_for_vim'

" Colorscheme
" Plug 'jnurmine/Zenburn'

" Terraform plugin
Plug 'hashivim/vim-terraform'

" NerdTree
Plug 'preservim/nerdtree'

call plug#end()

"
" " If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"

" colorscheme patch for Windows bash cause that terminal is 16 bit 
" let g:solarized_termcolors=256
" let g:solarized_termcolors=16
" let g:solarized_termtrans=1

" set t_Co=16
" set background="dark"
" set background=light
" colorscheme solarized
if has('gui_running')
  set background=dark
  " set background=light
  colorscheme solarized
  " colorscheme pablo
else
  " colorscheme zenburn
  " colorscheme pablo
  " colorscheme pablo
  " set background=light
  set background=dark
  colorscheme solarized
endif

" highlight spell check with underlines
hi clear SpellBad
hi SpellBad cterm=underline

imap <F12> <C-O><F12>
" Add a hotkey to save, compile and run C++ code
" autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

autocmd filetype cpp nnoremap <F4> :call SaveMakeAndRun()<CR>
autocmd filetype js nnoremap <F4> :call SaveMakeAndRunJS()<CR>
autocmd filetype html setlocal shiftwidth=2 tabstop=2
autocmd filetype yml setlocal shiftwidth=2 tabstop=2
autocmd filetype yaml setlocal shiftwidth=2 tabstop=2
autocmd filetype terraform setlocal shiftwidth=4 tabstop=4
autocmd filetype snippets setlocal shiftwidth=4 tabstop=4

" nmap <F10> :! python %:p <CR>
" execute with F5
" nmap <F5> :! source %/venv/bin/activate && python %:p && deactivate<CR>
nmap <F5> :w!<CR>:! python %:p <CR>
nmap <F6> :w!<CR>:! pytest -v -s <CR>
nmap <F7> :!echo "Adding current file to git " && git add %<CR>
nmap <F8> :set nonumber<CR>
nmap <F9> :!git commit -a && git push<CR>
"\b --> insert python breakpoint 
"\v --> insert ipython breakpoint 
" au FileType python map <silent> <leader>b oimport pdb; pdb.set_trace()<esc>
au FileType python map <silent> <leader>b ofrom IPython.core import debugger; debug = debugger.Pdb().set_trace; debug()<esc>
au FileType python map <silent> <leader>v ofrom IPython import embed; embed()<esc>

" save and run python code by pressing F10 key
au FileType python nnoremap <F10> :call SaveAndRunPython()<CR>
au FileType python nnoremap <F9> :call SaveRunPyInNewWindow()<CR>


" Set filetype as terraform file
au BufRead,BufNewFile *.tf       setfiletype terraform

" Set filetype as snippets file
au BufRead,BufNewFile *.snippets       setfiletype snippets

function! SaveAndRunPython()
        " chain command with pipe 
        exec ':w! | !clear && python '.shellescape('%')
        redraw!
endfunction

function! SaveRunPyInNewWindow()
    " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

    " save and reload current file
    silent execute "update | edit"

    " get file path of current file
    let s:current_buffer_file_path = expand("%")

    let s:output_buffer_name = "Python"
    let s:output_buffer_filetype = "output"

    " reuse existing buffer window if it exists otherwise create a new one
    if !exists("s:buf_nr") || !bufexists(s:buf_nr)
        silent execute 'botright new ' . s:output_buffer_name
        let s:buf_nr = bufnr('%')
    elseif bufwinnr(s:buf_nr) == -1
        silent execute 'botright new'
        silent execute s:buf_nr . 'buffer'
    elseif bufwinnr(s:buf_nr) != bufwinnr('%')
        silent execute bufwinnr(s:buf_nr) . 'wincmd w'
    endif

    silent execute "setlocal filetype=" . s:output_buffer_filetype
    setlocal bufhidden=delete
    setlocal buftype=nofile
    setlocal noswapfile
    setlocal nobuflisted
    setlocal winfixheight
    setlocal cursorline " make it easy to distinguish
    setlocal nonumber
    setlocal norelativenumber
    setlocal showbreak=""

    " clear the buffer
    setlocal noreadonly
    setlocal modifiable
    %delete _

    " add the console output
    silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

    " resize window to content length
    " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
    "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
    "       But if you close the output buffer then it returns to using the default size when its recreated
    "execute 'resize' . line('$')

    " make the buffer non modifiable
    setlocal readonly
    setlocal nomodifiable
endfunction

function! SaveMakeAndRun()
        " chain command with pipe 
        exec ':w! | !clear && g++ -std=c++11 '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')
        redraw!
endfunction
function! SaveMakeAndRunJS()
        exec ':w! | !clear && js -e'.shellescape('%').'
        redraw!
endfunction


"""""""""""""""""""""""
"  Generate/Use tags  "
"""""""""""""""""""""""
" go to project dir and do ctags -R
"usage: ^]  - jump to definition
"       g^] - for ambiguas tags
"       ^t  - for back up the tag stack
command! MakeTags !ctags -R .
"set autochdir 
"set tags+=./tags,tags;$HOME
"set tags+=./tags

" Ctl+] - go to definition
" Ctl+T - back from
" Open definition to new tab
nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" ============================
" Plugin Settings
" ============================

"""""""""""""""
"  powerline  "
"""""""""""""""
" set rtp+=$HOME/.vim/plugged/powerline/powerline/bindings/vim
" set rtp+=$HOME/prj/powerline/powerline
" set rtp+=$HOME/prj/powerline
" set laststatus=2
" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup

" ----------------------------
"           Airline
" ----------------------------
" let g:airline_powerline_fonts=1
" let g:airline#extensions#tabline#enabled=1
" let g:airline#extensions#ctrlp#show_adjacent_modes=1
" let g:airline#extensions#wordcount#enabled=1
" let g:airline#extensions#syntastic#enabled=1
" let g:airline#extensons#branch#format=1
" let g:airline#extensions#tabline#buffer_idx_mode=1

" ----------------------------
"        ultisnips
" ----------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsListSnippets="<c-j>"


"""""""""""""""
"  syntastic  "
"""""""""""""""
autocmd filetype python nnoremap <F3> :! pylama .<CR>
let g:syntastic_python_pylama=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Some frequently forgetable stuff                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy to <code>system</code> clipboard -- "+yy  - copy line to system clipboard


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Macros                                    "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" macro for code tags
let @c="bi<code>ea</code>"

" macro for p tags
let @p="^i<p> $a</p>j"

" macro for kbd tags
let @k="bi<kbd>ea</kbd>"

" macro for html comment
let @q="^i<!-- $a-->j"

" Note: if you want to make macro with ESC or other keys don't use ^[ chars. Instead
" of this just press Ctrl + v + Esc  in order to insert the correct char.
" This is the correct char  not ^[
" Note: " are escaped with \ because in vimrc they are comments
" let @a="^i\":.s/,/\"   :\"/g$a\",j"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Comments                                   "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:comment_map = { 
    \   "c": '\/\/',
    \   "cpp": '\/\/',
    \   "go": '\/\/',
    \   "java": '\/\/',
    \   "javascript": '\/\/',
    \   "lua": '--',
    \   "scala": '\/\/',
    \   "php": '\/\/',
    \   "python": '#',
    \   "ruby": '#',
    \   "rust": '\/\/',
    \   "sh": '#',
    \   "desktop": '#',
    \   "fstab": '#',
    \   "conf": '#',
    \   "profile": '#',
    \   "bashrc": '#',
    \   "bash_profile": '#',
    \   "gitconfig": '#',
    \   "terraform": '#',
    \   "snippets": '#',
    \   "yaml": '#',
    \   "yml": '#',
    \   "mail": '>',
    \   "eml": '>',
    \   "bat": 'REM',
    \   "ahk": ';',
    \   "vim": '"',
    \   "htmldjango": {"start_comment": '{#', "end_comment": '#}'},
    \   "html": {"start_comment": '<!--', "end_comment": '-->'},
    \   "css": {"start_comment": '\/\*', "end_comment": '\*\/'},
    \ }

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        if &filetype == 'htmldjango' || &filetype == 'html'|| &filetype == 'css'
            let comment_leader = s:comment_map[&filetype]["start_comment"]
            let comment_end = s:comment_map[&filetype]["end_comment"]
            if getline('.') =~ "^\\s*".comment_leader."\\(.*\\)".comment_end.""
                " Uncomment line 
                " s/^\s*{#\(.*\)#}/\1/
                execute "silent s/^\\(\\s*\\)" . comment_leader .  "\\(.*\\)" .  comment_end . "/\\1\\2/"
            else
                " Comment line 
                execute "silent s/^\\(\\s*\\)\\(.*\\)/\\1" . comment_leader .  "\\2" .  comment_end . "/"
            end
        else
            let comment_leader = s:comment_map[&filetype]
            if getline('.') =~ "^\\s*" . comment_leader . " \\(.*\\)"
                " Uncomment the line
                execute "silent s/^\\(\\s*\\)" . comment_leader ." ". "\\(.*\\)" . "/\\1\\2/"
            else 
                if getline('.') =~ "^\\s*" . comment_leader."\\(.*\\)"
                    " Uncomment the line
                    execute "silent s/^\\(\\s*\\)" . comment_leader .  "\\(.*\\)" ."/\\1\\2/"
                else
"                    Comment the line
                    execute "silent s/^\\(\\s*\\)\\(.*\\)/\\1" . comment_leader . " \\2" . "/"
                    " execute "silent s/^\\(\\s*\\)/" . comment_leader . " \\1/"
                end
            end
        end
    else
        echo "No comment leader found for filetype"
    end
endfunction


nnoremap <leader><Space> :call ToggleComment()<cr>
vnoremap <leader><Space> :call ToggleComment()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"          Escape/Unescape & < > in the range (default current line)          "
"          \H - escape
"          \h - unsecape
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! HtmlEntities(line1, line2, action)
  let search = @/
  let range = 'silent ' . a:line1 . ',' . a:line2
  if a:action == 0  " must convert &amp; last
    execute range . 'sno/&lt;/</eg'
    execute range . 'sno/&gt;/>/eg'
    execute range . 'sno/&amp;/&/eg'
  else              " must convert & first
    execute range . 'sno/&/&amp;/eg'
    execute range . 'sno/</&lt;/eg'
    execute range . 'sno/>/&gt;/eg'
  endif
  nohl
  let @/ = search
endfunction
command! -range -nargs=1 Entities call HtmlEntities(<line1>, <line2>, <args>)
noremap <silent> <Leader>h :Entities 0<CR>
noremap <silent> <Leader>H :Entities 1<CR>
