"autoload vimrc
autocmd! bufwritepost .vimrc source %
set encoding=utf-8
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
" filetype off
filetype plugin indent on
syntax enable

" disable bell
set visualbell

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
" set tw=100      " whdth (used for gd)
"set nowrap     " don't auto wrap on load
"set fo-=t      " don't auto. wrap test when typing
set colorcolumn=100
" highlight ColorColumn ctermbg=LightGreen

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes
Plug 'altercation/vim-colors-solarized', { 'set': 'all' }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'


" syntastic or vim-flake8
" NOTE: pip install pylint flake8 .. or just read :help syntastic-checkers
Plug 'vim-syntastic/syntastic'

" Terraform plugin
Plug 'hashivim/vim-terraform'

" https://github.com/juliosueiras/vim-terraform-completion#vim-terraform-completion-with-linter---demosdemomd
Plug 'juliosueiras/vim-terraform-completion'

" vim-autoformat https://vimawesome.com/plugin/vim-autoformat
Plug 'Chiel92/vim-autoformat'

Plug 'Valloric/YouCompleteMe'

" editconfig
Plug 'editorconfig/editorconfig-vim'


" NerdTree
Plug 'preservim/nerdtree'
call plug#end()

"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="horizontal"


" highlight spell check with underlines
hi clear SpellBad
hi SpellBad cterm=underline

imap <F12> <C-O><F12>
" Add a hotkey to save, compile and run C++ code
" autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>


" Set filetype as Docker file
au BufRead,BufNewFile Dockerfile  setfiletype dockerfile

" Set filetype as terraform file
au BufRead,BufNewFile *.tf  setfiletype terraform

" Set filetype as markup file
au BufRead,BufNewFile *.md  setfiletype markdown


" Set filetype as snippets file
au BufRead,BufNewFile *.snippets setfiletype snippets

" default text width 
set textwidth=100

" Different file types has different configs
autocmd filetype cpp nnoremap <F4> :call SaveMakeAndRun()<CR>
autocmd filetype js nnoremap <F4> :call SaveMakeAndRunJS()<CR>
autocmd filetype html setlocal shiftwidth=2 tabstop=2
autocmd filetype yml setlocal shiftwidth=2 tabstop=2
autocmd filetype yaml setlocal shiftwidth=2 tabstop=2
autocmd filetype terraform setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd filetype markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab textwidth=0
autocmd filetype snippets setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
autocmd filetype dockerfile setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab

" execute with F2
autocmd FileType python map <buffer> <F2> :w<CR>:call SaveAndRunPython()<CR>
autocmd FileType python imap <buffer> <F2> <esc> :call SaveAndRunPython()<CR>
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

function! SaveAndRunPython()
    " chain command with pipe
    silent execute "update | edit"
    " get file path of current file
    let s:current_buffer_file_path = expand("%")
    " add the console output
    execute "!clear && python " . shellescape(s:current_buffer_file_path, 1)
    " exec '!clear && python '.shellescape('%')
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

"""""""""""""""
"  Solarized  "
"""""""""""""""
" let g:solarized_termcolors=256
let g:solarized_termtrans = 1
let g:solarized_degrade = 0
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility= "normal"


" ----------------------------
"        ultisnips
" ----------------------------
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-e>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsListSnippets="<c-j>"


"""""""""""""""""
"  Statusline   "
"""""""""""""""""
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 



"""""""""""""""
"  syntastic  "
"""""""""""""""
autocmd filetype python nnoremap <F3> :! pylama .<CR>
let g:syntastic_python_pylama=1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Jump to next prev error with "<" and ">"
" NOTE: THINK OF other custom keys
" noremap < :lprevious<cr>
" noremap > :lnext<cr>

" NOTE: check doc for syntastic python-pylint --> :help syntastic-python-pylint
"
" This function search for .pylintrc file in upper folders and use it as pylint
" blueprint 4.9 in https://vimawesome.com/plugin/syntastic#faqconfig
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    return cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
endfunction

autocmd FileType python let b:syntastic_python_pylint_post_args =
            \ get(g:, 'syntastic_python_pylint_post_args', '') .
            \ FindConfig('--rcfile', '.pylintrc', expand('<afile>:p:h', 1))



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      Some frequently forgettable stuff                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy to <code>system</code> clipboard -- "+yy  - copy line to system clipboard
"
" let @+=@"     - copy default register into the clipboard
" let @*=@"     - copy default register into the X-11 primary (mouse clipboard)
" let @+=@a     - copy 'a' register into the clipboard

" \y will copy selection to clipboard
vnoremap <leader>y y :let @+=@"<cr>

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
            \   "dockerfile": '#',
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



if has('gui_running')
    " colorscheme pablo
    " set background=light
    set background=dark
    colorscheme solarized
else
    " colorscheme zenburn
    " colorscheme pablo
    " colorscheme pablo
    " set background=light
    set background=dark
    colorscheme solarized
endif

""""""""""""""""""""""""""""""""""""""""""
"  vim-autoformat related plugin config  "
""""""""""""""""""""""""""""""""""""""""""
" au BufWrite * :Autoformat
" https://vimawesome.com/plugin/vim-autoformat
let g:formatterpath = ['/usr/local/bin/tflint', '/Users/$USER/.pyenv/shims/pylint']
let g:formatdef_terraform = "tflint"
let g:formatters_terraform = ['terraform']
let g:formatter_yapf_style = 'google'
" autoformat verbose
let g:autoformat_verbosemode=1
" let g:autoformat_verbosemode=0
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
" \f will format selection with Autoformat
noremap <leader>F :Autoformat<CR>
vnoremap <leader>f :Autoformat<cr>


