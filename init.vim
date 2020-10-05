" __  ____   __  _   ___     _____ __  __ ____   ____
"|  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
"| |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
"| |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
"|_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|

" Author: @theniceboy

" This is the minimal version
" - no plugins
" - well yeah it's still bloated

" ===
" " === Auto load for first time uses
" " ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
		silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
						\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
			autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
		endif

" If you are WSL, maybe you need the settings.
noremap R :source ~/.config/nvim/init.vim<CR>
" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
"set clipboard=unnamed
let &t_ut=''
set autochdir


" ===
" === Editor behavior
" ===
set number
set relativenumber
set cursorline
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix
set wrap
set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow
set noshowmode
set showcmd
set wildmenu
set ignorecase
set smartcase
set shortmess+=c
set inccommand=split
set ttyfast "should make scrolling faster
set lazyredraw "same as above
set visualbell
silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=80
set updatetime=1000

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behavior
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
let g:terminal_color_0   = '#000000'
let g:terminal_color_1   = '#FF5555'
let g:terminal_color_2   = '#50FA7B'
let g:terminal_color_3   = '#F1FA8C'
let g:terminal_color_4   = '#BD93F9'
let g:terminal_color_5   = '#FF79C6'
let g:terminal_color_6   = '#8BE9FD'
let g:terminal_color_7   = '#BFBFBF'
let g:terminal_color_8   = '#4D4D4D'
let g:terminal_color_9   = '#FF6E67'
let g:terminal_color_10  = '#5AF78E'
let g:terminal_color_11  = '#F4F99D'
let g:terminal_color_12  = '#CAA9FA'
let g:terminal_color_13  = '#FF92D0'
let g:terminal_color_14  = '#9AEDFE'


" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
"noremap ; :

" Save & quit
noremap Q :q<CR>
noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Undo operations
"noremap l u

" Insert Key
"noremap k i
"noremap K I

" make Y to copy till the end of the line
nnoremap Y y$

" Copy to system clipboard
vnoremap Y "+y

" Indentation
nnoremap < <<
nnoremap > >>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
noremap <LEADER>tt :%s/    /\t/g

" Folding
noremap <silent> <LEADER>o za

" Open up lazygit
noremap \g :term lazygit<CR>
noremap <c-g> :term lazygit<CR>


" ===
" === Cursor Movement
" ===
"     ^
"     u
" < n   i >
"     e
"     v
"noremap <silent> u k
"noremap <silent> n h
"noremap <silent> e j
"noremap <silent> i l

" U/E keys for 5 times u/e (faster navigation)
noremap <silent> K 5k
noremap <silent> J 5j

" N key: go to the start of the line
"noremap <silent> N 0
" I key: go to the end of the line
"noremap <silent> I $

" Faster in-line navigation
noremap W 5w
noremap B 5b

" set h (same as n, cursor left) to 'end of word'
"noremap h e

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-U> 5<C-y>
noremap <C-E> 5<C-e>

" ===
" === Insert Mode Cursor Movement
" ===
inoremap <C-a> <ESC>A


" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" Disable the default s key
noremap s <nop>

" editing
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap ss <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmh :-tabmove<CR>
noremap tml :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source ~/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" \p to show the current buffer file path
nnoremap \p 1<C-G>

" Move the next character to the end of the line with ctrl+9
inoremap <C-u> <ESC>lx$p

" Opening a terminal window
noremap <LEADER>/ :term<CR>

" Press space twice to jump to the next '<++>' and edit it
noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
noremap tx :r !figlet

noremap <LEADER>- :lN<CR>
noremap <LEADER>= :lne<CR>

" find and replace
noremap \s :%s//g<left><left>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!chromium % &"
	elseif &filetype == 'markdown'
		exec "MarkdownPreview"
		exec "MarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run %
	endif
endfunc


" experimental
set lazyredraw


" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim



hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70


" ===================== Start of Plugin ==============================
call plug#begin('~/.vim/plugged')

" When the plugin is correctly loaded, there will be a nice statusline at the bottom of each vim window.
Plug 'vim-airline/vim-airline'

" Elegant vim theme with bright colors.
Plug 'connorholyday/vim-snazzy'

" Testing my own plugin
" Plug 'theniceboy/vim-calc'

" Pretty Dress
Plug 'bling/vim-bufferline'
Plug 'bpietravalle/vim-bolt'
Plug 'theniceboy/vim-deus'

"Plug 'arzg/vim-colors-xcode'

" Status line
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

" File navigation
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Plug 'kevinhwang91/rnvimr'
Plug 'airblade/vim-rooter'
" Plug 'pechorin/any-jump.vim'

" Taglist
" Plug 'liuchengxu/vista.vim'

" Debugger
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}

" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'

" Snippets
" Plug 'SirVer/ultisnips'
Plug 'theniceboy/vim-snippets'

" Undo Tree
Plug 'mbbill/undotree'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'fszymanski/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'

" Autoformat
Plug 'Chiel92/vim-autoformat'

" Tex
" Plug 'lervag/vimtex'

" CSharp
Plug 'OmniSharp/omnisharp-vim'
Plug 'ctrlpvim/ctrlp.vim' , { 'for': ['cs', 'vim-plug'] } " omnisharp-vim dependency

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'MaxMEllon/vim-jsx-pretty', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
"Plug 'jaxbot/browserlink.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'posva/vim-vue'

" " Go
" Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" Python
" Plug 'tmhedberg/SimpylFold', { 'for' :['python', 'vim-plug'] }
Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
"Plug 'vim-scripts/indentpython.vim', { 'for' :['python', 'vim-plug'] }
"Plug 'plytophogy/vim-virtualenv', { 'for' :['python', 'vim-plug'] }
Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }

" " Flutter
" Plug 'dart-lang/dart-vim-plugin'
" Plug 'f-person/pubspec-assist-nvim', { 'for' : ['pubspec.yaml'] }
" 
" " Swift
" Plug 'keith/swift.vim'
" Plug 'arzg/vim-swift'

" Markdown
" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'theniceboy/antovim' " gs to switch
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
Plug 'easymotion/vim-easymotion'
" Plug 'Konfekt/FastFold'
Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'AndrewRadev/splitjoin.vim'

" For general writing
" Plug 'junegunn/goyo.vim'
"Plug 'reedes/vim-wordy'
"Plug 'ron89/thesaurus_query.vim'

" Bookmarks
" Plug 'MattesGroeger/vim-bookmarks'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Documentation
"Plug 'KabbAmine/zeavim.vim' " <LEADER>z to find doc

" Mini Vim-APP
"Plug 'jceb/vim-orgmode'
"Plug 'mhinz/vim-startify'
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'

" Vim Applications
Plug 'itchyny/calendar.vim'
   
" Other visual enhancement
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
" Plug 'mg979/vim-xtabline'
" Plug 'wincent/terminus'
   
" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc' " vim-session dep

" Dependencies
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'kana/vim-textobj-user'
" Plug 'roxma/nvim-yarp'



call plug#end()
" ===
" === <++>
" ===



" ===================== Start of Plugin Settings =====================
" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" coloes
" urce $MYVIMRC
colorscheme snazzy

" Open the _machine_specific.vim file if it has just been created
" urce $MYVIMRC
" urce $MYVIMRC
" urce $MYVIMRC
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif

" WSL yank/paste support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
	    autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

nnoremap "+p :r !powershell.exe -Command "& {Get-Clipboard}"<Enter>
