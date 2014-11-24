" Leader
let mapleader = ","

set nocompatible  " Use Vim settings, rather then Vi settings
" set nobackup
" set nowritebackup
" set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=500
set ruler         " show the cursor position all the time
" set showcmd       " display incomplete commands
set lazyredraw
set incsearch     " do incremental searching
set hlsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autoindent " always set autoindenting on
set ignorecase smartcase
set smarttab
" set guifont=Triskweline_10:h10
set viminfo+=!
set guioptions-=T
set showmatch
set visualbell
set noerrorbells
set cursorline    " highlight current line
set cuc cul       " highlight active column
set tags=tags;/   " get ctags to look up through the directory structure
set autoread      " automtically read changed files
set backspace=indent,eol,start

" Prevent Vim from clobbering the scrollback buffer. See
" " http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" Force utf-8 encoding
set encoding=utf-8

" When the page starts to scroll, keep the cursor 6 lines from the top and
" bottom
set scrolloff=6

"""""""""""""""""""""""""""""""""""""""
" BACKUP / TMP FILES
" """""""""""""""""""""""""""""""""""""""
" " taken from
" "
" http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name
" " Save your backups to a less annoying place than the current directory.
" " If you have .vim-backup in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/backup or . if all else fails.

if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" " If you have .vim-swap in the current directory, it'll use that.
" " Otherwise it saves it to ~/.vim/swap, ~/tmp or .

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Leaders
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
map <Leader>bb :BundleInstall <cr>
map <Leader>bi :!bundle install<cr>
map <Leader>cu :Tabularize /\|<CR>
map <Leader>co ggVG"*y " Copy all to clipboard
map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gc :Gcommit -m ""<LEFT>
map <Leader>gs :Gstatus<CR>
map <Leader>gw :!git add . && git commit -m 'WIP' && git push<cr>
map <Leader>m :Rmodel
map <Leader>o :w<cr>:call RunCurrentLineInTest()<CR>
map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<CR>
map <Leader>rs :vsp <C-r>#<cr><C-w>w
map <Leader>so :so %<cr>
map <Leader>sov :so ~/.vimrc<cr>
" map <Leader>st :!mvn -Dsuites=com.oddz.api.GameplayApiEndpointSpec test<CR>
map <Leader>u :Runittest<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>
map <Leader>spell :setlocal spell! spelllang=en_us<CR>
map <Leader>ppjs :%! python -m json.tool

" File shortcuts
map <Leader>cn :e ~/Dropbox/Notes/coding-notes.md<cr> " Consider making this project specific
map <Leader>dr :e ~/Dropbox<cr>
map <Leader>ec :e ~/code/
map <Leader>nn :sp ~/Dropbox/Notes/programming_notes.md<cr>
map <Leader>pn :sp ~/Dropbox/Notes/project_notes.md<cr>
map <Leader>tsl :sp ~/Dropbox/Notes/tool_sharpening_list.md<cr>
map <Leader>sn :e ~/.vim/snippets/ruby.snippets<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vib :tabe ~/.vimrc.bundles<CR>
map <Leader>task :sp ~/Dropbox/Notes/tasks.md<CR>
map <leader>md :!open -a Marked %<cr><cr>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

map <Leader>n :nohl<cr>
" imap <C-l> :<Space>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" Underline the current line with '='
nmap <silent> ,u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> ,u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> ,u~ :t.\|s/./\\~/g\|:nohls<cr>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Tabular.vim
nmap <Leader>a<Space> :Tabularize /^[^<space>]*\zs/<CR>
vmap <Leader>a<Space> :Tabularize /^[^<space>]*\zs/<CR>
nmap <Leader>a# :Tabularize /#<CR>
vmap <Leader>a# :Tabularize /#<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a-> :Tabularize /-><CR>
vmap <Leader>a-> :Tabularize /-><CR>
nmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
vmap <Leader>a: :Tabularize /:\zs/l0l1<CR>
nmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
vmap <Leader>a, :Tabularize /,\zs/l0l1<CR>
filetype plugin indent on

" Tagbar
nmap <Leader>tb :TagbarToggle<CR>

" clipboard goodies
map <Leader>p :set paste<CR>o<esc>:r !pbpaste<CR>:set nopaste<cr>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
set clipboard=unnamed " default yank and paste to the osx clipboard

augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  " autocmd BufRead,BufNewFile *.md setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

""" Easytags config
let g:easytags_async = 1
:let g:easytags_dynamic_files = 1
"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip)$|/target/)'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<c-j>', '<down>'],
  \ 'PrtHistory(1)':        ['<c-i>', '<up>']
  \ }
" fix root path of CtrlP plugin
let g:ctrlp_working_path_mode = ''

map ,fb :CtrlPBuffer<cr>
map ,fr :CtrlP .<cr>
map ,ff :CtrlP<cr>
map ,fm :CtrlPMixed<cr>

" Color scheme
set background=dark
" let g:solarized_termcolors=256
colorscheme solarized
set guifont=Source\ Code\ Pro\ for\ Powerline:h16

" colorscheme Tomorrow-Night
" highlight NonText guibg=#060606
" highlight Folded  guibg=#0A0A0A guifg=#9090D0

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" Numbers
set relativenumber
set numberwidth=5

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
" nnoremap <C-n> :call NumberToggle()<cr>
" Snippets are activated by Shift+Tab
let g:snippetsEmu_key = "<S-Tab>"

set wildignore+=*/tmp/*,*/target/*,*.so,*.swp,*.zip,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
set complete=.,w,t
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
" nnoremap <Left> :echoe "Use h"<CR>
" nnoremap <Right> :echoe "Use l"<CR>
" nnoremap <Up> :echoe "Use k"<CR>
" nnoremap <Down> :echoe "Use j"<CR>

let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'
" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>sp :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
" nnoremap <Leader>s :call RunNearestSpec()<CR>
" nnoremap <Leader>l :call RunLastSpec()<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Highlight the status line
highlight StatusLine ctermfg=black ctermbg=yellow

" status line setup with git info
set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
" set stl=%f\ %m\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

" command! Q q " Bind :Q to :q
command! Qall qall
cmap q1 q!

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
" map K <Nop>

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Turn on spell-checking in markdown and text.
" au BufRead,BufNewFile *.md,*.txt setlocal spell

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!bin/rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set up some useful Rails.vim bindings for working with Backbone.js
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee

" FileType configs
" autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
" autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Scala
let g:scala_sort_across_groups=1 " vim-scala sorting plugin for 1st order grouping
" let g:scala_first_party_namespaces='\(controllers\|views\|models\|util\|de.\)' " default sorting for above

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <Leader>rn :call RenameFile()<cr>

" " Write and create dirs if necessary
function! WriteAndCreateDirs()
  execute ':!mkdir -p %:h'
  write
endfunction

" Make change commands insert a $ marker instead of just overwriting
set cpoptions=ces$

" Try to fix iterm2 + arrow keys issues
nnoremap <silent> OA <Up>
nnoremap <silent> OB <Down>
nnoremap <silent> OD <Left>
nnoremap <silent> OC <Right>
inoremap <silent> OA <Up>
inoremap <silent> OB <Down>
inoremap <silent> OD <Left>
inoremap <silent> OC <Right>

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

