" vim : foldmethod=marker :
" original code from Vicente Adolfo Bolea Sanchez 
" modified by sunghoon kim
" https://bluesh55.github.io/2016/10/09/vim-ide/
" http://agvim.wordpress.com/2017/09/05/vim-plugins-50/
"Bundle {{{
" nocompatible 
set nocp
" backspace option -- vim8 essential!
set bs=indent,eol,start
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
"Synthstic check -- pylint... is too slow
"Plugin 'scrooloose/syntastic'
"https://github.com/w0rp/ale -- 
Plugin 'w0rp/ale'
" 괄호 자동완성 delimiMate 
Plugin 'Raimondi/delimitMate'
Plugin 'majutsushi/tagbar'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlp.vim'
Plugin 'linediff.vim'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
"github.com/luochen1990/rainbow
Plugin 'luochen1990/rainbow'
" csv 파일 다루기 --  github.com/chrisbra/csv.vim 
Plugin 'chrisbra/csv.vim'
" vim 정렬하기 - 사용법: 비쥬얼 블럭 후 gl,  비쥬얼블록친부분 왼쪽 기준 , 로 정렬! http://github.com/tommcdo/vim-lion 
Plugin 'tommcdo/vim-lion'
" auto commenter
Plugin 'scrooloose/nerdcommenter'
" 증가 감소 시키기 visual block 잡은 후 :I 1 :I -1, :II 2 0, :II 2
Plugin 'VisIncr'
Plugin 'patstockwell/vim-monokai-tasty'
Plugin 'kristijanhusak/vim-hybrid-material'
" indent line 
Plugin 'Yggdroot/indentLine'
" smooth scroll
Plugin 'terryma/vim-smooth-scroll'
"Vim auto compete - vim8 is needed // need complie for using YoucompleteMe  
" https://johngrib.github.io/wiki/vim-ycm-python3/
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'
call vundle#end()
" }}}
"설정을 추가한 후에 :w로 저장한 후 변경된 .vimrc 파일을 :source % 또는 :so %
"vim 명령 모드에서 :PluginInstall을 실행, :PluginList -- 뭐 깔렸나 보기, PluginClean -- 제거
filetype plugin indent on
filetype plugin on
filetype indent on
syntax on
"## 256 terminal
set t_Co=256
set background=dark
let g:solarized_termcolors=256
let g:solarized_diffmode="high"
set term=screen-256color
" colorscheme solarized
" colorscheme distinguished
" colorscheme xoria256
" colorscheme molokai
colorscheme badwolf
" colorscheme vim-monokai-tasty
"## More options
set ruler
set incsearch
set hlsearch
set wildmenu
set hidden  " Useful feature, to have multiples buffer open
"## Cursor
set cursorline
match Error /{{{\|}}}/
" General settings {{{
"Set backup off since we are always using git :D
set noswapfile
set nobackup
set nowritebackup
"Correct broken redraw
set ttyfast
set noerrorbells
set novisualbell
set t_vb=
set lazyredraw
"Indentation 4 is standard
set shiftwidth=4
set expandtab
set tabstop=4
set sts=4
set foldmethod=marker
set cino=N-s
"uncategorized
set exrc
set wildignore=*.o,*.class,*.pyc
"Deal with html
"autocmd pe html setlocal sw=2 ts=2 et smartindent
autocmd FileType Makefile setlocal shiftwidth=2 tabstop=2 expandtab
" autocmd FileType Verilog  setlocal shiftwidth=4 tabstop=2 expandtab
" }}}
" Gvim {{{
if has('gui_running')
  set guifont=Monaco\ 12
  set linespace=2    "Better line-height
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
endif
" }}}
""Key-binding {{{
" ---------------------------------------------------------------------
" mapleader  
let mapleader = " "
nnoremap Q <Nop>
" Tabs
map <silent> <F2> :tabprevious<Enter>
map <silent> <F3> :tabnext<Enter>
map <silent> <F4> :tabnew<Enter>

map <silent> <F9> :NERDTreeToggle<Enter>

map <silent> <F10> :Tagbar<Enter>
"Customized shortcuts
 
nnoremap <silent> <space>q :q<cr>

nnoremap <silent> <space>w :w!<cr>
" 이거 뭐지?
nnoremap <silent> <space>e :Gstatus<CR>
nnoremap <silent> <space>E :bd .git/index<CR>
"창하나 더 띄우기/끄기
nnoremap <silent> <space>a :copen<CR>
nnoremap <silent> <space>A :cclose<CR>
" 
nnoremap <silent> <space>d :Gdiff<CR>
nnoremap <silent> <space>t :SyntasticCheck<CR>
nnoremap <silent> <space>T :SyntasticReset<CR>
nnoremap <silent> <space>r :SyntasticToggleMode<CR>
nnoremap <silent> <space>/ :nohlsearch<CR>
ab W w
ab Wq wq
ab wQ wq
ab WQ wq
ab Q q
ab WQA wqa
ab Wqa wqa
"}}}
" ALE {{{
let g:ale_completion_enabled = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '!X'
let g:ale_sign_warning = '!W'
let g:ale_statusline_format = [' %d E', ' %d W ', '']
"}}}
" Syntastic https://github.com/vim-syntastic/syntastic {{{
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" "
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0
"" }}}
"NERDTree "{{{
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeDirArrows = 0
" }}}
" Tagbar "{{{
let g:tagbar_compact = 1
let g:tagbar_width = 30
"}}}
""" YouCompleteMe {{{
" need to compile after install 
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
"""To avoid conflict snippets
" let g:ycm_key_list_select_completion = ['<c-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-k>', '<Up>']
" let g:ycm_autoclose_preview_window_after_completion = 1
""" ------------------------------------------------------------
" let g:ycm_warning_symbol = '>*'
" let g:ycm_show_diagnostics_ui = 0
" let g:ycm_server_python_interpreter = '/home/tool/anaconda/install/3.5.2/bin/python'
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_python_binary_path = '/home/tool/anaconda/install/3.5.2/bin/python'
" let g:ycm_collect_identifiers_from_tags_files = 0
" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_complete_in_comments = 1
" let g:ycm_min_num_of_chars_for_completion = 1 
""" set key mapping
" nnoremap <c>g :YcmCompleter GoTo<CR>
" nnoremap <c>gg :YcmCompleter GoToImprecise<CR>
" nnoremap <c>d :YcmCompleter GoToDeclaration<CR>
" nnoremap <c>t :YcmCompleter GetType<CR>
" nnoremap <c>p :YcmCompleter GetParent<CR>
" from commnet in https://github.com/johngrib/simple_vim_guide/blob/master/md/vimrc.md 
set omnifunc=syntaxcomplete#Complete
"}}}
"" ultisnips {{{
" let g:UltiSnipsExpandTrigger="<Tab>"
" let g:UltiSnipsJumpForwardTrigger="<Tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
" let g:UltiSnipsEditSplit="vertical"
""" let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips']
" let g:UltiSnipsSnippetDirectories = ['UltiSnips']
"}}}
" Signature {{{
let g:snips_author = $GIT_AUTHOR_NAME
" }}}
" Fugitive {{{
set diffopt+=vertical
set updatetime=250
" }}}
" CtrlP {{{
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|public$\|log$\|tmp$\|vendor$',
            \ 'file': '\v\.(exe|so|dll)$'
    \}
" }}}
" gist {{{
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_post_anonymous = 0
" }}}
"RainBow {{{
let g:rainbow_active = 1
"}}}
"Vim-Lion {{{ 시동어 gl,     glip=    3gLi(     
let b:lion_squeeze_spaces = 1 
"}}}
""nerdcommenter {{{
"Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
 let g:NERDCompactSexyComs = 1
" " Align line-wise comment delimiters flush left instead of following code  indentation
let g:NERDDefaultAlign = 'left'
" " Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" " Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"}}}
"INDENTLINE {{{
let g:indentLine_color_gui = '#385900'
let g:indentLine_color_term = 100
let g:indentLine_char = '¦'
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 0
"let g:indentLine_enabled = 0
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'text', 'sh']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_maxLines = 3000
nnoremap \il :IndentLinesToggle
"}}}
"" vim-smooth-scroll{{{
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 10, 5)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 10, 5)<CR>
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 10, 3)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 10, 3)<CR>
" }}}
"customization {{{
"https://github.com/johngrib/simple_vim_guide/blob/master/md/vimrc.md
set title
set nu
set encoding=utf-8
set ignorecase
set smartcase 
set smartindent
set showmatch
set langmap=ㅁㅠㅊㅇㄷㄹㅎㅗㅑㅓㅏㅣㅡㅜㅐㅔㅂㄱㄴㅅㅕㅍㅈㅌㅛㅋ;abcdefghijklmnopqrstuvwxyz
"set paste" 붙여넣기 계단현상 없애기
"select all
map <c-1> ggVG <cr>
imap <c-1> <esc> ggVG <cr> i
set diffopt=vertical
"}}}
" 지금 이 파일 source 하기 
":so %
":reg -- 레지스터 읽어오기 
"펴기 z-r

