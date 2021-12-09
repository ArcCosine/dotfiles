""
" For Windows and Mac Version _vimrc
" Since 2011.12.13
" Last version 2021.12.08

"for python3 path
if has('win32')
    let g:python3_host_prog = fnameescape('C:/Users/AC/AppData/Local/Programs/Python/Python310/python.exe') 
else 
    let g:python3_host_prog = fnameescape('/C/Users/AC/AppData/Local/Programs/Python/Python310/python.exe') 
endif

"for vimproc
let g:vimproc#download_windows_dll = 1

set enc=utf-8
set fenc=utf-8
"set encoding=japan
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932

"filetype off
filetype on
filetype indent on
syntax enable

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

set number
set nobackup
"スワップファイルは作らない
set noswapfile

"undoファイルは造らない
set noundofile

"クリップボード有効化
set clipboard+=unnamed

"常にステータスラインを表示
set laststatus=2
set noshowmode

"backspaceで色々消せる
set backspace=indent,eol,start

"Complement
set wildmenu
set wildmode=list:full

"検索ループ
set wrapscan

"タブはスペースに
set expandtab




"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
if has('win32')
    let s:dein_dir = fnameescape('C:/dein/.cache/dein/')
else
    let s:dein_dir = fnameescape('/C/dein/.cache/dein/')
endif

let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
execute 'set runtimepath^=' . s:dein_repo_dir


if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

 " denite
  "call dein#add('Shougo/denite.nvim')

  " プラグインリストを収めた TOML ファイル
  let s:toml_dir  = $HOME . '/.config/vim' 
  let s:toml      = s:toml_dir . '/dein.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" dein end.


" API TOKEN
" See:https://thinca.hatenablog.com/entry/dein-vim-with-graphql-api
let g:dein#install_github_api_token = 'Your_API_KEY'


"For ZenCoding
let g:user_zen_settings={
\'lang': "ja"
\}

inoremap <expr> = search('\(&\<Bar><Bar>\<Bar>+\<Bar>-\<Bar>/\<Bar>>\<Bar><\) \%#', 'bcn')? '<bs>= '
    \ : search('\(*\<Bar>!\)\%#', 'bcn') ? '= '
    \ : smartchr#one_of('=', ' = ', ' == ', ' === ')

"neocomplcache
let g:neocomplcache_enable_at_startup=1 

"" reloadable vimrc
nnoremap <silent> ,r :<C-u>source $MYVIMRC \| if has('gui_running') \| source $MYGVIMRC \| endif<CR>

"" for denite 
" set denite keymaping
nnoremap <SID>[ug] <Nop>
nmap ,u <SID>[ug]

nnoremap <silent> <SID>[ug]m :<C-u>Denite file_mru<CR>
nnoremap <silent> <SID>[ug]b :<C-u>Denite buffer<CR>
nnoremap <silent> <SID>[ug]r :<C-u>Denite register<CR>
nnoremap <silent> <SID>[ug]n :<C-u>DeniteBufferDir file:new<CR>
nnoremap <silent> <SID>[ug]f :<C-u>Defx -split=vertical -winwidth=40 -search=`expand('%:p')` -direction=topleft `expand('%:p:h')`<CR>
nnoremap <silent> <SID>[ug]s :<C-u>TweetVimSay<CR>
nnoremap <silent> <SID>[ug]t :<C-u>TweetVimHomeTimeline<CR>


" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

call denite#custom#var('grep', {
            \ 'command': ['pt'],
            \ 'default_opts': [
            \   '-i', '--nogroup', '--nocolor', '--smart-case'],
            \ 'recursive_opts': [],
            \ 'pattern_opt': [],
            \ 'separator': ['--'],
            \ 'final_opts': [],
            \ })


" For vsnip
" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

"for buffer
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4 ft=javascript fenc=utf-8
au BufNewFile,BufRead *.css set tabstop=4 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=4 shiftwidth=2
au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=2

" for python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"for text
autocmd FileType text set formatoptions=q

" for markdown
au BufRead,BufNewFile *.md set filetype=markdown
let g:vim_markdown_folding_disabled=1

" for asciidoc
au BufNewFile,BufRead *.{asciidoc,adoc,asc} set filetype=asciidoc

" replace
nnoremap <silent> cy ce<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<Esc>:let@/=@1<CR>:noh<CR>

" F5 command history
" F6 search history
nnoremap <F5> <Esc>q:  
nnoremap <F6> <Esc>q/

" ignore q: q/ 
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop> 

" Tab change
" nnoremap <C-j> :<C-u>tabn<CR>
" nnoremap <C-k> :<C-u>tabp<CR>

"For vim over
nnoremap <silent> <Leader>s :OverCommandLine<CR>
" カーソル下の単語をハイライト付きで置換
nnoremap sub :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
" コピーした文字列をハイライト付きで置換
nnoremap subp y:OverCommandLine<CR>%s!<C-r>=substitute(@0, '!', '\\!', 'g')<CR>!!gI<Left><Left><Left>

" yankround.vim 
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50

autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

"For open browser
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)


command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

" Change current directory.
nnoremap <silent> <Space>cd :<C-u>CD<CR>

"for design
"if !has('gui_running')
"  set t_Co=256
"endif
colorscheme desert
hi Visual gui=none guifg=khaki guibg=olivedrab


"コマンド実行中は再描画しない
set lazyredraw
"高速ターミナル接続を行う
set ttyfast

"for mac vim
autocmd VimLeave * macaction terminate:

"" vim-quickrun
let g:quickrun_config = {
\	'rb' : {
\		'command' : 'ruby',
\		'runner' : 'vimproc',
\		'exec' : '%c %s'
\	},
\}

"For ruby
let g:quickrun_config['ruby'] = {
\		'command': 'ruby',
\		'exec': '$rvm_bin_path/ruby %s',
\		'tempfile': '{tempname()}.rb'
\	}

"For type script.
let g:typescript_indent_disable = 1

" For rename
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))


"For japanese
if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif
if has('iconv')
	let s:enc_euc = 'euc-jp'
	let s:enc_jis = 'iso-2022-jp'
	" iconvがeucJP-msに対応しているかをチェック
	if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'eucjp-ms'
		let s:enc_jis = 'iso-2022-jp-3'
		" iconvがJISX0213に対応しているかをチェック
	elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
		let s:enc_euc = 'euc-jisx0213'
		let s:enc_jis = 'iso-2022-jp-3'
	endif
	" fileencodingsを構築
	if &encoding ==# 'utf-8'
		let s:fileencodings_default = &fileencodings
		let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
		let &fileencodings = &fileencodings .','. s:fileencodings_default
		unlet s:fileencodings_default
	else
		let &fileencodings = &fileencodings .','. s:enc_jis
		set fileencodings+=utf-8,ucs-2le,ucs-2
		if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
			set fileencodings+=cp932
			set fileencodings-=euc-jp
			set fileencodings-=euc-jisx0213
			set fileencodings-=eucjp-ms
			let &encoding = s:enc_euc
			let &fileencoding = s:enc_euc
		else
			let &fileencodings = &fileencodings .','. s:enc_euc
		endif
	endif
	" 定数を処分
	unlet s:enc_euc
	unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
	function! AU_ReCheck_FENC()
		if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
			let &fileencoding=&encoding
		endif
	endfunction
	autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" 改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
	set ambiwidth=double
endif

function! Scouter(file, ...)
  let pat = '^\s*$\|^\s*"'
  let lines = readfile(a:file)
  if !a:0 || !a:1
    let lines = split(substitute(join(lines, "\n"), '\n\s*\\', '', 'g'), "\n")
  endif
  return len(filter(lines,'v:val !~ pat'))
endfunction
command! -bar -bang -nargs=? -complete=file Scouter
\        echo Scouter(empty(<q-args>) ? $MYVIMRC : expand(<q-args>), <bang>0)

"for markdown
nnoremap \m :call DisplayMarkdown()<CR>
function! DisplayMarkdown()
    !node "C:\tools\markdown-maker\markdown-maker.js" "%" > "C:\tmp\__markdown.html"
    vert split C:/tmp/__markdown.html
    call cursor(1,1)
    % yank
    bdelete 
endfunction

"for asciidoc
nnoremap \a :call DisplayAsciiDoc()<CR>
function! DisplayAsciiDoc()
    !node "C:\tools\asciidoc-maker\index.js" "%" > "C:\tmp\__asciidoc.html"
    vert split C:/tmp/__asciidoc.html
    call cursor(1,1)
    % yank
    bdelete 
endfunction


" for defx
autocmd FileType defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " Define mappings
nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \  defx#do_action('open_directory') :
  \  defx#do_action('multi', ['drop', 'quit'])
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('multi', [['open', 'vsplit'], 'quit'])	  nnoremap <silent><buffer><expr> P
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_tree', 'toggle')
	  nnoremap <silent><buffer><expr> K
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> N
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> M
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> C
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> S
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <Space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'G' : 'k'
	  nnoremap <silent><buffer><expr> <C-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <C-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
 	endfunction

" lightline.vim
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [
    \     ['mode', 'paste'],
    \     ['filename'],
    \     ['ale']
    \   ],
    \   'right': [
    \     ['lineinfo', 'syntastic'],
    \     ['percent','denite'],
    \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
    \     ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok'],
    \   ]
    \ },
    \ 'component_function': {
    \   'modified': 'MyModified',
    \   'readonly': 'MyReadonly',
    \   'fugitive': 'MyFugitive',
    \   'filename': 'MyFilename',
    \   'fileformat': 'MyFileformat',
    \   'filetype': 'MyFiletype',
    \   'fileencoding': 'MyFileencoding',
    \   'denite': 'MyDenite',
    \   'mode': 'MyMode',
    \   'syntastic': 'SyntasticStatuslineFlag',
    \   'charcode': 'MyCharCode',
    \   'gitgutter': 'MyGitGutter',
    \   'ale': 'ALEGetStatusLine',
    \   'lsp': 'LSPStatus',
    \ },
    \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
    \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }   
    \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok'
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left'      
      \ }

" let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]] }

function! MyModified()
  return &ft =~ 'help\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|gundo' && &ro ? '?' : ''
endfunction

function! MyFilename()
    return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
                \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
                \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction


function! MyFugitive()
  try
    if &ft !~? 'gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '? '._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth('.') > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth('.') > 60 ? lightline#mode() : ''
endfunction

function! MyGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
        \ || ! get(g:, 'gitgutter_enabled', 0)
        \ || winwidth('.') <= 90
    return ''
  endif
  let symbols = [
        \ g:gitgutter_sign_added . ' ',
        \ g:gitgutter_sign_modified . ' ',
        \ g:gitgutter_sign_removed . ' '
        \ ]
  let hunks = GitGutterGetHunkSummary()
  let ret = []
  for i in [0, 1, 2]
    if hunks[i] > 0
      call add(ret, symbols[i] . hunks[i])
    endif
  endfor
  return join(ret, ' ')
endfunction

function! MyCharCode()
  if winwidth('.') <= 70
    return ''
  endif

  " Get the output of :ascii
  redir => ascii
  silent! ascii
  redir END

  if match(ascii, 'NUL') != -1
    return 'NUL'
  endif

  " Zero pad hex values
  let nrformat = '0x%02x'

  let encoding = (&fenc == '' ? &enc : &fenc)

  if encoding == 'utf-8'
    " Zero pad with 4 zeroes in unicode files
    let nrformat = '0x%04x'
  endif

  " Get the character and the numeric value from the return value of :ascii
  " This matches the two first pieces of the return value, e.g.
  " "<F>  70" => char: 'F', nr: '70'
  let [str, char, nr; rest] = matchlist(ascii, '\v\<(.{-1,})\>\s*([0-9]+)')

  " Format the numeric value
  let nr = printf(nrformat, nr)

  return "'". char ."' ". nr
endfunction

function! LSPStatus() abort
    let l:errors = 0
    let l:warnings = 0
    for item in getqflist()
        if item["type"] == "E"
            let l:errors += 1
        else
            let l:warnings += 1
        endif
    endfor
    return l:errors + l:warnings == 0 ? "LSP: OK" : "LSP: E:" . l:errors . " " . "W:" . l:warnings
endfunction

function! MyDenite() abort
     if &filetype isnot# 'denite'
         return ''
     else
         return s:denite_statusline()
     endif
 endfunction


 function! s:denite_statusline() abort
     let p =denite#get_status('path')
     " 飾りをはずす
     let p = substitute(p, '\(\[\|\]\)', '', 'g')
     " パスをホームディレクトリからの相対パスに変換する
     let p = fnamemodify(p,':~')
     " パスが長い時は強引に切り詰める
     if strlen(p) > 40
         let p = '.../' . fnamemodify(p,':h:h:t'). '/'
                     \ . fnamemodify(p,':h:t'). '/'. fnamemodify(p, ':t')
     endif
     let path =  '[' . p . ']'
     let buf = 'buffer:' . denite#get_status('buffer_name')
     let source = denite#get_status('sources')
     return  buf . ' ' . source . ' ' . path
 endfunction
    

" for weather.vim
let g:weather_city_name = '東京'

" for ime off
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>

" twwetvim show icon
let s:user_rtp = expand('~/.vim')
let s:plugin_info = s:user_rtp . '/info'
let g:tweetvim_config_dir = s:plugin_info . '/tweetvim/'
let g:tweetvim_display_icon = 1
let g:tweetvim_async_post = 1
let g:tweetvim_expand_t_co = 1

" ale
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'markdown' : ['textlint']
\}

let g:ale_statusline_format = ['E %d', 'W %d', '◆ok']


let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" ファイルオープン時にチェックしたくない場合
let g:ale_lint_on_enter = 0

let g:ale_linters_explicit = 1

" key settings
nmap <silent> <C-a>k <Plug>(ale_previous_wrap)
nmap <silent> <C-a>j <Plug>(ale_next_wrap)

"previm
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

"git bash
function! GitBash()
    " 日本語Windowsの場合`ja`が設定されるので、入力ロケールに合わせたUTF-8に設定しなおす
    let l:env = {
                \ 'LANG': systemlist('"C:/Program Files/Git/usr/bin/locale.exe" -iU')[0],
                \ }

    " remote連携のための設定
    if has('clientserver')
        call extend(l:env, {
                    \ 'GVIM': $VIMRUNTIME,
                    \ 'VIM_SERVERNAME': v:servername,
                    \ })
    endif

    " term_startでgit for windowsのbashを実行する
    call term_start(['C:/Program Files/Git/bin/bash.exe', '-l'], {
                \ 'term_name': 'Git',
                \ 'term_finish': 'close',
                \ 'curwin': v:true,
                \ 'cwd': $USERPROFILE,
                \ 'env': l:env,
                \ })

endfunction

nnoremap <Leader>g :<C-u>call GitBash()<CR>
