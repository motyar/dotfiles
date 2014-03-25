set shortmess+=atI "Startup message is irritating
set nocompatible
set noeb
set novb        " turn off visual bell
set noerrorbells visualbell t_vb=
set vb t_vb=    " turn off error beep/flash
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
"set pastetoggle=<Insert>
set lazyredraw 
set scrolloff=15
set showcmd 
set noshowmode
" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set foldenable        "dont fold by default
set foldlevel=99         "this is just what i use
" Command line completion
set wildmenu
set wildmode=list:longest,full  

set showmatch
set matchtime=0

set nobackup
set noswapfile

set virtualedit=block "Move freely in visual mode


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

" Save on 1 in normal mode
map <silent> 1 :set cmdheight=5<ESC>:w<CR>:set cmdheight=1<CR>
" qq Quite please
map qq :q<CR>

" When I hit enter, I want new line and Insert mode
map <CR> o

" Whenever I hit , I try to delete that char and Insert Mode
map <BS> bdwi

" <|>: Reselect visual block after indent
xnoremap < <gv
xnoremap > >gv

" .: repeats the last command on every line
xnoremap . :normal.<cr>

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" Save on  key jj 
imap jj <ESC>


map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>

imap ( ()<left>
imap [ []<left>
imap < <><left>
imap { {<cr><cr>}<up><tab>

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

" Move tabes with alt and arrow keys
map <silent><A-Right> :tabnext<CR>
map <silent><A-Left> :tabprevious<CR>

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
     Texplore
     let t:expl_buf_num = bufnr("%")
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

let g:netrw_liststyle=3

" Change directory to the current buffer when opening files.
set autochdir

" change the mapleader from \ to ,
let mapleader=","
nmap <silent> <leader>h :silent :nohlsearch<CR>
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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
  let &t_EI .= "\<Esc>[4 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

"{{{ ---Session Persistance--- From http://www.andrew.cmu.edu/user/chaokul/vimrc
au VimLeave * call VimLeave() 
au VimEnter * call VimEnter() 

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
au InsertChange * call InsertStatuslineColor(v:insertmode)
"Enter in nopaste
au InsertEnter * set nopaste
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
