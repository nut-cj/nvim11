" ==== Settings{{{
" 设置行号
set number
set rnu
set noswapfile

"三个值分别指行首的空白符，换行符和插入模式开始之前的字符
set backspace=indent,eol,start
"set backspace=indent,start

"设置关键字
set iskeyword+=-

"设置共享系统剪切板
"set clipboard=unnamedplus

"设置字符编码
set fileencoding=utf-8
set encoding=UTF-8

" So that I can see `` in markdown files
set conceallevel=0

" 设置主题
colorscheme gruvbox

" 忽略大小写
set ignorecase
"如果有一个大写字母，则切换到大小写敏感查找
set smartcase

set tabstop=2 " 一个tab，4个空格
set shiftwidth=2 "默认4个空格
set expandtab "tab键永远输入的是空格
set softtabstop=0 "关闭空格tab混用
autocmd FileType html,css,xml,yaml,json set sw=2 ts=2

"高亮当前鼠标行
set cursorline 

"允许未保存跳转
set hidden

"设置自动缩进
set autoindent

"设置空格为.
set list
silent set listchars lcs=tab:>-,trail:.

set scrolloff=3

"设置每行列数，使用gq生效
set textwidth=0


"设置24-bit真彩色
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Changes the effect of the |:mkview|
set viewoptions=cursor,folds,slash,unix

" 设置窗口分割
set splitright
set splitbelow

"不显示状态
set noshowmode

"在状态栏显示命令
set showcmd

"即时预览命令的效果（目前只支持:s替换）
set inccommand=split

set wildmenu
set virtualedit=block
set shortmess+=c

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup
set directory=~/.config/nvim/tmp/sessions

set regexpengine=0    "This selects the default regexp engine
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif "如果在退出时有修改, 则再次打开时自动跳转到修改的地方
"}}}

" ==== Basic Mappings{{{
let mapleader=','
nnoremap <leader><CR> :set nohlsearch<CR>

"保存
nmap <leader>w :w<CR>
nnoremap <leader>w :w<CR>
nnoremap D ^D

" 设置Esc快捷键
inoremap jk <ESC>
inoremap kj <ESC>
inoremap <c-l> <c-o>a

" 设置:快捷键
xmap ; :
nmap ; :

" 设置窗口切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <leader>ii :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>ini :w<cr><bar>:source ~/.config/nvim/init.vim<CR>

"buffer跳转
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>

iabbrev mian main

" Resize splits with arrow keys
nnoremap <c-up> :res +5<CR>
nnoremap <c-down> :res -5<CR>
nnoremap <c-left> :vertical resize-5<CR>
nnoremap <c-right> :vertical resize+5<CR>

" Place the two screens up and down
noremap sp <C-w>t<C-w>K
" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srs <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H

"tab转换为空格
nnoremap <LEADER>tt :%s/\t/ /g<CR>
vnoremap <LEADER>tt :s/\t/ /g<CR>

nnoremap <silent>  <space>q :Bd!<cr>
nnoremap  <space>w :w<cr>
nnoremap <buffer> <leader>re :call <SID>refresh()<CR>
"}}}

"==== Vim-Plug{{{

call plug#begin('~/.config/nvim/plugged')
    "NerdTree
"    Plug 'preservim/nerdtree' |
"            \ Plug 'Xuyuanp/nerdtree-git-plugin'
"    Plug 'ryanoasis/vim-devicons'
"    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    "vim-airline
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    "The fastest (Neo)Vim plugin for asynchronously displaying the colours in the file (#rrggbb, #rgb, rgb(a)
    "需要安装GO
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

    "Coc.nvim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
        "搭配coc-emmet, coc-emmet仅提供补全，搭配emmet-vim, 使用其余功能
        Plug 'mattn/emmet-vim'

    "tmux补全
    Plug 'wellle/tmux-complete.vim'
    "Plug 'zimingzpp/zppskills' 

    "Snippets 强大的代码补全
    Plug 'SirVer/ultisnips'
    Plug 'theniceboy/vim-snippets'

    "后悔药
    Plug 'mbbill/undotree'

    "对齐
    Plug 'godlygeek/tabular'

    "对齐线
    Plug 'Yggdroot/indentLine'

    "语法检查
    Plug 'vim-syntastic/syntastic'

    "注释
    Plug 'scrooloose/nerdcommenter'

    "自动配对
    Plug 'jiangmiao/auto-pairs'

    "添加包裹符号神器
    Plug 'tpope/vim-surround'

    "预览MarkDown
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    "开屏暴击
    Plug 'mhinz/vim-startify'

    "Bd不破坏view
    Plug 'moll/vim-bbye'

    " 生成markdown TOC
    Plug 'mzlogin/vim-markdown-toc'

    "一个很棒的自动表格创建器, 格式化程序允许您在键入时创建整洁的表。
    Plug 'dhruvasagar/vim-table-mode'

    " 字符切换
    Plug 'AndrewRadev/switch.vim'

    " surroundings
    Plug 'tpope/vim-surround'
    "Gruvbox
    Plug 'morhetz/gruvbox'

    "Vim脚本，帮助在Python模块中添加导入语句。
    Plug 'mgedmin/python-imports.vim'

    "自动保存
    "Plug '907th/vim-auto-save'
    Plug 'vim-scripts/vim-auto-save'

    "<==custom==>
    "
    "js
    Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less']  }

    " Autoformat
    Plug 'google/vim-maktaba'
    Plug 'google/vim-codefmt'

    " 剪贴板提示
    Plug 'junegunn/vim-peekaboo'

    " GO
    Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }




call plug#end()
"}}}

"==== Plug-config{{{
"==== NERDTree{{{
"nnoremap <leader>t :NERDTreeToggle<CR>
"nnoremap <leader>f :NERDTreeFind<CR>
"" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim starts with a directory argument.
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
"    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
"
"" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
"
"" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * silent NERDTreeMirror
"
"" Exit Vim if NERDTree is the only window left.
"autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
"    \ quit | endif
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
"}}}
"==== Vim-airline{{{
let g:airline_theme='base16_adwaita'
let g:airline#extensions#tabline#enabled=1
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 0
"}}}
"==== Vim-hexokinase{{{
let g:Hexokinase_highlighters = [
\   'sign_column',
\   'backgroundfull',
\ ]
"}}}
"==== Coc.nvim{{{
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup


" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-css',
    \ 'coc-cssmodules',
    \ 'coc-eslint',
    \ 'coc-html',
    \ 'coc-emmet',
    \ 'coc-tsserver',
    \ 'coc-yank',
    \ 'coc-pyright',
    \ 'coc-sql',
    \ 'coc-vetur',
    \ 'coc-marketplace',
    \]



" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.  if has("patch-8.1.1564") Recently vim can merge signcolumn and number column into one
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"




" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Format :call CocAction('format')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"}}}
"==== Coc-explorer{{{
"
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <space>ee :CocCommand explorer<CR>:wincmd=<CR>
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets<CR>
"}}}
"==== Ultisnips{{{
let g:UltiSnipsExpandTrigger       = "<c-q>"
let g:UltiSnipsListSnippets        = "<c-cr>"
let g:UltiSnipsJumpForwardTrigger  = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
let g:UltiSnipsEditSplit="vertical"
"}}}
"==== Autopairs{{{
let g:AutoPairsMultilineClose=0
"}}}
"==== Switch{{{
let g:switch_mapping = "-"
"}}}
"==== Vim-table-mode{{{
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

let g:table_mode_always_active = 0
"}}}
"==== Vim-auto-save{{{
"let g:auto_save = 1
"}}}
"==== vim-surround{{{
"查看字符编码函数:echo char2nr("P")
let g:surround_80 = "Plug '\r'"
"}}}
"===custom===
"====AutoFormat{{{
augroup autoformat_settings
  " autocmd FileType bzl AutoFormatBuffer buildifier
  " autocmd FileType c,cpp,proto,javascript,arduino AutoFormatBuffer clang-format
  " autocmd FileType dart AutoFormatBuffer dartfmt
  " autocmd FileType go AutoFormatBuffer gofmt
  " autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  " autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType rust AutoFormatBuffer rustfmt
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END"
"}}}
"====vim-go{{{
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0

"}}}
"}}}

"==== Commands{{{
" Compile function
noremap  <Space>r :call CompileRunGcc()<CR>
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
  silent! exec "!google-chrome % &"
 elseif &filetype == 'markdown'
  exec "MarkdownPreview"
 elseif &filetype == 'tex'
  silent! exec "VimtexStop"
  silent! exec "VimtexCompile"
 elseif &filetype == 'dart'
  exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
  silent! exec "CocCommand flutter.dev.openDevLog"
 elseif &filetype == 'javascript'
  set splitbelow
  :sp
  :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
 elseif &filetype == 'go'
  set splitbelow
  :sp
  :term go run .
 endif
endfunc

autocmd FileType coc-explorer,markdown :IndentLinesDisable

au TermClose * call TerminalQuit()
function! TerminalQuit()
    let bid = get(t:, '__terminal_bid__', -1)
    if bid < 0
        return
    endif
    let name = bufname(bid)
    if name == ''
        return
    endif
    exec "bw! ". name
endfunc

autocmd TermOpen * startinsert

function! LessToCss()
    let current_file = shellescape(expand('%:p'))
    let filename = shellescape(expand('%:t:r'))
    let command = "silent !lessc " . current_file . "/../" . filename . ".less " . current_file . "/../" . filename . ".css"
    execute command
endfunction

autocmd BufWritePost,FileWritePost *.less call LessToCss()
autocmd BufRead * setlocal foldmethod=marker
autocmd BufRead * normal zM

"设置窗口焦点

autocmd WinEnter * setlocal cursorline
 
autocmd WinLeave * setlocal nocursorline

"退出时，跳转掉关闭时修改的地方
autocmd BufReadPost *
    \ if line("'\"")>1 && line("'\"")<line("$")&& &ft !~# 'commit'
    \ | exe "normal! g'\""
    \ | endif

function! InsertNum(num) abort
    let startNum = 1
    if line('$')-line('.')+1 < a:num
        let endNum=line('$')-line('.')+1
    else
        let endNum = a:num
    endif
    for i in range(startNum, endNum)
        exec "normal 0i".i."."
        exec "normal j"
    endfor
    let jump = endNum-startNum+1
    exec "normal ".jump."k"
endfunction

"}}}

" ==== Custom {{{
"
" }}}
