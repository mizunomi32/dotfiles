set termguicolors
set number
set clipboard=unnamed
"set cursorline

" タブをスペースに置き換え
set tabstop=2
set shiftwidth=2
set softtabstop=0
set expandtab
set smarttab
set shiftround

set encoding=UTF-8
" フォント指定
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double

" nvim の使うpython3を指定
"let g:python3_host_prog = expand($HOME.'/.pyenv/versions/anaconda3-5.2.0/bin/python3')
let s:config_dir = $HOME.'/.config/nvim/'

" dein自体の自動インストール
let s:dein_dir = s:config_dir.'dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  call system('pip install neovim')
  call system('pip3 install neovim')
endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " Let dein manage dein
  " Required:
  "call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')
  "
  " Add or remove your plugins here:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Pluginをtomlで管理
  let s:toml = s:config_dir . '/dein.toml'
  let s:toml_lazy = s:config_dir . '/dein_lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 0})

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': '01203d4c9' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" denite.nvim
" Denite用プレフィックス
nmap [denite] <Nop>
map <C-j> [denite]

" プロジェクト内のファイル検索
nmap <silent> [denite]<C-P> :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
" バッファに展開中のファイル検索
nmap <silent> [denite]<C-B> :<C-u>Denite buffer -highlight-mode-insert=Search<CR>
" ファイル内の関数/クラス等の検索
nmap <silent> [denite]<C-O> :<C-u>Denite outline -highlight-mode-insert=Search<CR>
" dotfiles配下をカレントにしてfile_rec起動
nmap <silent> [denite]<C-V> :<C-u>call denite#start([{'name': 'file_rec', 'args': ['~/.dotfiles']}]) -highlight-mode-insert=Search=Search<CR>

" 上下移動を<C-N>, <C-P>
call denite#custom#map('normal', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('normal', '<C-P>', '<denite:move_to_previous_line>')
call denite#custom#map('insert', '<C-N>', '<denite:move_to_next_line>')
call denite#custom#map('insert', '<C-P>', '<denite:move_to_previous_line>')
" 入力履歴移動を<C-J>, <C-K>
call denite#custom#map('insert', '<C-J>', '<denite:assign_next_text>')
call denite#custom#map('insert', '<C-K>', '<denite:assign_previous_text>')
" 横割りオープンを`<C-S>`
call denite#custom#map('insert', '<C-S>', '<denite:do_action:split>')
" 縦割りオープンを`<C-I>`
call denite#custom#map('insert', '<C-I>', '<denite:do_action:vsplit>')
" タブオープンを`<C-O>`
call denite#custom#map('insert', '<C-O>', '<denite:do_action:tabopen>')

" file_rec検索時にfuzzymatchを有効にし、検索対象から指定のファイルを除外
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_project_files', 'matcher_ignore_globs'])

" 検索対象外のファイル指定
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

" ファイル内の <Tab> が対応する空白の数。
":set tabstop=4
" <Tab> の挿入や <BS> の使用等の編集操作をするときに、<Tab> が対応する空白の数。
":set softtabstop=4
" インデントの各段階に使われる空白の数。
":set shiftwidth=4
" Insertモードで <Tab> を挿入するとき、代わりに適切な数の空白を使う。（有効:expandtab/無効:noexpandtab）
":set noexpandtab
" オンのときは、ウィンドウの幅より長い行は折り返され、次の行に続けて表示される。（有効:wrap/無効:nowrap）
:set nowrap

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。（有効:wrapscan/無効:nowrapscan）
:set wrapscan
" # 独自キーバインド
tnoremap <silent> <ESC> <C-\><C-n>

nnoremap s <Nop>
" 分割
" 水平分割
nnoremap ss :<C-u>sp<CR>
nnoremap s- :<C-u>sp<CR>
" 垂直分割
nnoremap sv :<C-u>vs<CR>
nnoremap s\| :<C-u>vs<CR>
" ウインド移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap s<down> <C-w>j
nnoremap s<up> <C-w>k
nnoremap s<right> <C-w>l
nnoremap s<left> <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
" タブ関連
nnoremap sn gt
nnoremap sp gT
nnoremap st :<C-u>tabnew<CR>
" スクリプト実行
autocmd BufNewFile,BufRead *.sh nnoremap <C-e> :!bash %
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :!ruby %
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :!python %
autocmd BufNewFile,BufRead *.pl nnoremap <C-e> :!perl %

" python 自動修正
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

" terminal で行番号表示しない
autocmd BufAdd * if &buftype ==# 'terminal' | set nonumber | endif
" Shift + F で自動修正
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>

" 一定時間入力がなかったらノーマルモードに {{{
set updatetime=10000

function s:InsertToNormal()
    call feedkeys("\<Esc>")
endfunction

autocmd CursorHoldI * call s:InsertToNormal()

"}}}
