set tabstop=4
set shiftwidth=4
set expandtab
set scrolloff=9999
set notimeout " don't timeout on mappings
set ttimeout " do timeout on terminal key codes
set timeoutlen=100 " timeout after 100 msec

"Testing something ok more  

" Save on 1 in normal mode
map <silent> 1 :w<CR>
" qq Quite please
map qq :q<CR>

" When I hit enter, I want new line and Insert mode
map <CR> o

" Whenever I hit , I try to delete that char and Insert Mode
map <BS> bdwi
" Make navigation a bit easy
nmap l e
nmap h ge<right>
" Save on  key jj 
imap jj <ESC>

map <right> <nop>
map <left> <nop>
map <up> <nop>
map <down> <nop>

" folding settings
set foldmethod=indent   "fold based on indent
" set foldmethod=syntax    " fold based on syntax
set foldnestmax=10      "deepest fold is 10 levels
set foldenable        "dont fold by default
set foldlevel=99         "this is just what i use

" Command line completion
set wildmenu
set wildmode=list:longest,full  

" Autosave session please, :mksession! is too long to type
" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'

set cul                                           
hi CursorLine term=none cterm=none ctermbg=234
      
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

" Speed up response to ESC key
set notimeout
set ttimeout
set timeoutlen=100
  
" What an hack
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

" silent
" let g:netrw_silent=1

" Start ssh tunnel
" Change directory to the current buffer when opening files.
set autochdir

function! Sh()
    Vexplore
endfunction 

