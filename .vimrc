" execute pathogen#infect()
syntax enable
" set termguicolors
set background=dark
let g:solarized_termcolors=16
if !has('gui_running')
    let g:solarized_termtrans=1
endif
colorscheme solarized

filetype plugin indent on
set nocompatible
set shortmess+=atTI "Startup message is irritating
set noeb
set novb        " turn off visual bell
set noerrorbells visualbell t_vb=
set vb t_vb=    " turn off error beep/flash
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Don’t add empty newlines at the end of files
set binary
set noeol
set noruler
set autoindent
set smartindent
set tabstop=4 " size of a hard tabstop
set shiftwidth=4 " size of an "indent"
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab
set expandtab
set scrolloff=9999
set notimeout " don't timeout on mappings
set ttimeout " do timeout on terminal key codes
set timeoutlen=10 " timeout after 100 msec
set cmdheight=1
set showmatch
set pastetoggle=<F3>
set lazyredraw
set scrolloff=17
"set noshowmode
" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldenable        "dont fold by default
set foldlevel=99         "this is just what i use
" Command line completion
set wildmenu
set wildmode=list:longest,full

" When I close a tab, remove the buffer
set nohidden


set showmatch
set matchtime=0

set nobackup
set noswapfile

set virtualedit=block "Move freely in visual mode
"Please never show status line
 set laststatus=1
" set guitablabel=%N/\ %t\ %M

" get infinite undo https://news.ycombinator.com/item?id=18901621 
" Be sure to mkdir ~/.vim/undodir
set undofile
set undodir=~/.vim/undodir


" Open help in new tab
cabbrev help tab help
cabbrev h tab h



" Set xterm title
set title

set ttyfast         " smoother changes

set cursorcolumn "to enable highlighting the cursor column
set cul

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

" Make backspace delete lots of things
set backspace=indent,eol,start

" No need to show mode
"set noshowmode

" Set paste on nn
map <silent> nn <esc>:set paste<ESC>i

" Save on hh in normal mode
map <silent> hh <esc>:set cmdheight=5<ESC>:w<CR>:set cmdheight=1<CR>
imap <silent> hh <esc>:set cmdheight=5<ESC>:w<CR>:set cmdheight=1<CR>
" qq Quite please
map qq :q<CR>:set showtabline=1<cr>

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" .: repeats the last command on every line
xnoremap . :normal.<cr>

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

imap <up> <nop>
imap <down> <nop>

map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>

noremap h <NOP>
noremap l <NOP>
imap ( ()<esc>i
imap () ()<esc>i
imap [ []<esc>i
imap [] []<esc>i
imap < <><esc>i
imap { {}<esc>i


"Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk

"Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" Tab: Go to matching element
nnoremap <Tab> %

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

function! OpenURL(url)
  if has("win32")
    exe "!start cmd /cstart /b ".a:url.""
  elseif $DISPLAY !~ '^\w'
    exe "silent !sensible-browser \"".a:url."\""
  else
    exe "silent !sensible-browser -T \"".a:url."\""
  endif
  redraw!
endfunction
command! -nargs=1 OpenURL :call OpenURL(<q-args>)
" open URL under cursor in browser
nnoremap ff:OpenURL <cfile><CR>
nnoremap gs :OpenURL http://www.google.com/search?q=<cword><CR>
nnoremap gh :OpenURL http://www.google.com/search?q=

"Please open gmail for me
nnoremap gm :OpenURL https://mail.google.com/mail/h/<CR>

"Split style
hi vertsplit term=none cterm=none ctermbg=none ctermfg=black
set fillchars+=vert:\│

set wmw=0
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>

"tabline styling
hi TabLine      term=none cterm=none ctermbg=232 ctermfg=gray gui=reverse
hi TabLineFill  term=none cterm=none ctermbg=232 gui=reverse
hi TabLineSel   term=none cterm=none ctermbg=none ctermfg=white gui=bold
hi Title        guifg=none guibg=none gui=bold

" Hide that ~ for blank line
hi NonText ctermfg=black guifg=black
hi CursorLine term=none cterm=none ctermbg=234
hi Folded term=none cterm=none ctermbg=234
hi MatchParen term=none cterm=none ctermfg=234
hi CursorColumn term=none cterm=none ctermbg=234

" now set it up to change the status line based on mode
if version >= 700
    au InsertEnter * silent hi CursorLine term=none cterm=none ctermbg=232
    au InsertLeave * silent hi CursorLine  term=none cterm=none ctermbg=234
    au InsertEnter * silent hi CursorColumn term=none cterm=none ctermbg=none
    au InsertLeave * silent hi CursorColumn term=none cterm=none ctermbg=234
endif

" if we want to try autocompletion

function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction


" Remap the tab key to select action with InsertTabWrapper
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" nnoremap <Space> :
map <Space> za

"FireFox like tab shortcuts
nnoremap <silent><A-Right> :set showtabline=1<cr>:tabnext<cr>
nnoremap <silent><A-Left>  :set showtabline=1<cr>:tabprevious<CR>
nnoremap <C-T> :tabe<Space>
nnoremap <C-H> :%s///g<left><left><left>


" Goto file under cursor in new tab
map gf <c-w>gf

" lets try this, if works well
imap jj <esc>
imap kk <esc>

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
    "Texplore
    :tabfirst
    ":Tex
    let t:expl_buf_num = bufnr("%")
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

let g:netrw_fastbrowse=2
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_list_hide = &wildignore

" Change directory to the current buffer when opening files.
set autochdir

" change the mapleader from \ to ,
let mapleader=","
nmap <silent> <leader>h :silent :nohlsearch<CR>
nmap <silent> <leader>n :silent :set number!<CR>
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Show “invisible” characters
set ts=4 sw=4
set lcs=tab:\|\ ,trail:·,eol:¬,nbsp:_
hi SpecialKey ctermfg=232

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Please dont hand vim on Cntl+s
map <C-S> <nop>

if &term =~ "xterm\\|rxvt"
        " use an orange cursor in insert mode
        "let &t_SI = "\<Esc>]12;white\x7"
        " use a red cursor otherwise
        "let &t_EI = "\<Esc>]12;white\x7"
        silent !echo -ne "\033]12;white\007"
        " reset cursor when vim exits
        autocmd VimLeave * silent !echo -ne "\033]112\007"
        " use \003]12;gray\007 for gnome-terminal
endif

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[6 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

"{{{ ---Session Persistance--- From http://www.andrew.cmu.edu/user/chaokul/vimrc
"au VimLeave * call VimLeave()
"au VimEnter * call VimEnter()

let g:PathToSessions = $HOME . ""

" {{{ function! VimEnter()
function! VimEnter()
   if argc() == 0
      " gvim started with no files
"      if has("browse") == 1
"         let g:SessionFileName = browse(0, "Select Session", g:PathToSessions, "/LastSession.vim")
"         if g:SessionFileName != ""
"            execute "source " . g:SessionFileName
"         endif
"      else
         " For non-gui vim
         let LoadLastSession = confirm("Restore last session?", "&Yes\n&No")
         if LoadLastSession == 1
            execute "source " . g:PathToSessions . "/LastSession.vim"
         else
             call LoadSessions()
         endif
"      endif
   endif
endfunction
"//}}}

"{{{ function! VimLeave()
function! VimLeave()
   execute "mksession! " . g:PathToSessions . "/LastSession.vim"
   if exists("g:SessionFileName") == 1
      if g:SessionFileName != ""
         execute "mksession! " . g:SessionFileName
      endif
   endif
endfunction
"}}}

"{{{ function! LoadSessions()
function! LoadSessions()
    let result = "List of sessions:"
    let sessionfiles = glob(g:PathToSessions . "/*.vim")
    while stridx(sessionfiles, "\n") >= 0
        let index = stridx(sessionfiles, "\n")
        let sessionfile = strpart(sessionfiles, 0, index)
        let result = result . "\n " . fnamemodify(sessionfile, ":t:r")
        let sessionfiles = strpart(sessionfiles, index + 1)
    endwhile
    let result = result . "\n " . fnamemodify(sessionfiles, ":t:r")
    let result = result . "\n" . "Please enter a session name to load (or empty to start normally):"
    let sessionname = input(result)
    if sessionname != ""
        let g:SessionFileName = g:PathToSessions . "/" . sessionname . ".vim"
        execute "source " . g:SessionFileName
    endif
endfunction
"}}}



" Dirty hack to pasteToggel on Insert key and Cur line highlight to show pastemode
"{{{
function! InsertStatuslineColor(mode)
      if a:mode == 'i'
        if &paste
           hi CursorLine term=none cterm=none ctermbg=232
           set nopaste
        else
           hi CursorLine term=none cterm=none ctermbg=black
          set paste
        endif
      elseif a:mode == 'r'
        call feedkeys("\<Insert>", "n") "Never an replace mode
      else
          echo a:mode
      endif
endfunction
"This will toggel on <Inserr>
"au InsertChange * call InsertStatuslineColor(v:insertmode)
"Enter in nopaste
"au InsertEnter * set nopaste
"}}}

set showmode
au InsertLeave * set nopaste

"{{{ Start and stop ssh tunnel, Fast remote editing via http://www.erikzaadi.com/2013/03/07/fast-remote-editing-with-vim/
"function! StartSshTunnel(machine)
    "let shellcmd = "ssh ".a:machine." -f -N -o ControlMaster=auto -o ControlPath=/tmp/%r@%h:%p"
    "let tunnel=system(shellcmd)
"endfunction
"
"function! StopSshTunnel()
   "let kill = system("lsof -i -n | grep ssh | awk '{print $2}' | xargs kill -9")
"endfunction
"
"au FileType netrw au VimEnter * call StartSshTunnel(g:netrw_machine)
"au FileType netrw au VimLeave * call StopSshTunnel()
"}}}



" Return to last edit position when opening files (You want this!) http://amix.dk/vim/vimrc.html
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>
" allow the . to execute once for next line
map . .j

"" Auto run ssh connection TODO

"let shellcmd = 'ssh '.g:netrw_machine.' -f -N -o ControlMaster=auto -o ControlPath=/tmp/%r@%h:%p'
"let s:syntax =  'sh .vs'. g:netrw_machine
""au FileType php au VimEnter * !exec s:syntax


nnoremap G Gzz

nore ; :
nore , ;

"Shortcut for comment and uncomment this
map cc I//<esc>
map ucc I<right><right><bs><bs><esc>

iab /** /**<cr>*<cr>*<cr>*<cr>*/<up><up>

" Because pkzip is not good enought 
set cm=blowfish


" via http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText() "{{{2 
let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}2

"{{{ http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits.html
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"}}}

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

set updatetime=250

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'itchyny/lightline.vim'
" Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
call plug#end()


set autowrite

map <C-m> :cnext<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

let g:go_test_timeout = '10s'
let g:go_fmt_command = "goimports"

autocmd BufWritePre *.go call go#lint#Run()

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
