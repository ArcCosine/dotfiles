""
" For Mac Version _vimrc
" Since 2011.12.13
" Last version 2013.09.17

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
"set tab:>\ 

"for NeoBundler

set nocompatible               " be iMproved
filetype plugin indent off     " required!

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
 call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'vim-scripts/project.tar.gz'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/git-vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/favstar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/qiita-vim'
NeoBundle 'mattn/emoji-vim'
NeoBundle 'mattn/lgtm-vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'koron/chalice'
NeoBundle 'Better-Javascript-Indentation'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'taichouchou2/alpaca_powertabline'
"NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/vcscommand.vim'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'yuroyoro/yuroyoro256.vim'
NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'hrsh7th/vim-versions'
NeoBundle 'yuratomo/gmail.vim'
NeoBundle 'hallison/vim-markdown'
NeoBundle 'zeis/vim-kolor'
NeoBundle 'matchit.zip'
"NeoBundle 'ruby-matchit'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'ArcCosine/weather.vim'
NeoBundle 'mopp/googlesuggest-source.vim'
NeoBundle 'mattn/googlesuggest-complete-vim'
NeoBundle 'osyo-manga/vim-over'
NeoBundle 'LeafCage/yankround.vim'
"NeoBundle 'syui/wauto.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'kmnk/vim-unite-svn'
NeoBundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!

"Auto save enable.
"let g:auto_write = 1

"For vimfiler
let g:vimfiler_as_default_explorer=1


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

"" for unite
let g:unite_enable_start_insert=0

" set unite keymaping
nnoremap <SID>[ug] <Nop>
nmap ,u <SID>[ug]

nnoremap <silent> <SID>[ug]b :<C-u>Unite buffer<CR>
nnoremap <silent> <SID>[ug]o :<C-u>Unite bookmark -default-action=open<CR>
nnoremap <silent> <SID>[ug]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <SID>[ug]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <SID>[ug]m :<C-u>Unite file_mru -default-action=tabdrop<CR>
nnoremap <silent> <SID>[ug]u :<C-u>Unite buffer file_mru file -default-action=tabdrop<CR>
nnoremap <silent> <SID>[ug]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file -default-action=tabdrop<CR>
nnoremap <silent> <SID>[ug]l :<C-u>Unite vcs/log<CR>
nnoremap <silent> <SID>[ug]c :<C-u>Unite vcs/commit<CR>
nnoremap <silent> <SID>[ug]t :<C-u>Unite tweetvim<CR>
nnoremap <silent> <SID>[ug]s :<C-u>TweetVimSay<CR>

"Close Unite
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-o> unite#do_action('tabopen')

"for candidate
call unite#custom_max_candidates("file_mru", 1000)

"for buffer
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4 ft=javascript fenc=utf-8
au BufNewFile,BufRead *.css set tabstop=4 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=4 shiftwidth=2
au BufNewFile,BufRead *.php set tabstop=4 shiftwidth=2
au BufNewFile,BufRead *.php set tags+=$HOME/php.tags  

" vim-tags
au BufNewFile,BufRead *.php let g:vim_tags_project_tags_command = "ctags --languages=php -f ~/php.tags  2>/dev/null &"

"for javascript
"autocmd FileType javascript set tabstop=2 shiftwidth=2

" for python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"for text
autocmd FileType text set formatoptions=q

" for coffee script
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et

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
nnoremap <C-j> :<C-u>tabn<CR>
nnoremap <C-k> :<C-u>tabp<CR>

" For vimtweet
"let g:tweetvim_display_icon=1

" tagsジャンプの時に複数ある時は一覧表示                                        
nnoremap <C-]> g<C-]> 

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
""履歴一覧(kien/ctrlp.vim)
nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>


function! RTrim()
let s:cursor=getpos(".")
%s/\s\+$//e
call setpos(".", s:cursor)
endfunction

autocmd BufWritePre *.php,*.rb,*.js,*.bat,*.py call RTrim()
autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

"for project.vim
let g:proj_window_width=20

" Comment or uncomment lines from mark a to mark b.
function! CommentMark(docomment, a, b)
  if !exists('b:comment')
    let b:comment=CommentStr() . ' '
  endif
  if a:docomment
    exe "normal! '" . a:a . "_\<C-V>'" . a:b . 'I' . b:comment
  else
    exe "'".a:a.",'".a:b . 's/^\(\s*\)' . escape(b:comment,'/') . '/\1/e'
  endif
endfunction

" Comment lines in marks set by g@ operator.
function! DoCommentOp(type)
  call CommentMark(1, '[', ']')
endfunction

" Uncomment lines in marks set by g@ operator.
function! UnCommentOp(type)
  call CommentMark(0, '[', ']')
endfunction

" Return string used to comment line for current filetype.
function! CommentStr()
  if &ft == 'cpp' || &ft == 'java' || &ft == 'javascript'
    return '//'
  elseif &ft == 'vim'
    return '"'
  elseif &ft == 'python' || &ft == 'perl' || &ft == 'sh' || &ft == 'R' || &ft == 'ruby'
    return '#'
  elseif &ft == 'lisp'
    return ';'
  endif
  return ''
endfunction

nnoremap <Leader>c <Esc>:set opfunc=DoCommentOp<CR>g@
nnoremap <Leader>C <Esc>:set opfunc=UnCommentOp<CR>g@
vnoremap <Leader>c <Esc>:call CommentMark(1,'<','>')<CR>
vnoremap <Leader>C <Esc>:call CommentMark(0,'<','>')<CR>


" For neosnippet
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"set completeopt-=preview

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

"URL encode and decode
command! -nargs=0 -range URLEncode :<line1>,<line2>call <SID>URLEncode()
command! -nargs=0 -range URLDecode :<line1>,<line2>call <SID>URLDecode()

"from chalice.vim
function! s:URLEncode()
 let l:line=getline('.')
 let l:encoded=AL_urlencode(l:line)
 call setline('.', l:encoded)
endfunction

"from chalice.vim
function! s:URLDecode()
 let l:line=getline('.')
 let l:encoded=AL_urldecode(l:line)
 call setline('.', l:encoded)
endfunction

"for make
set makeprg=ant
nnoremap <silent> <C-l>2 :<C-u>silent make -f ~/Sites/src/build3/build.xml test_popin2\|echo 'done'<CR>
nnoremap <silent> <C-l>l :<C-u>silent make -f ~/Sites/src/build3/build.xml test_popin_ad\|echo 'done'<CR>
"nnoremap <silent> <C-l>r :<C-u>silent make -f ~/Sites/src/build3/build.xml test_popin_retarget\|echo 'done'<CR>
nnoremap <silent> <C-l>k :<C-u>silent make -f ~/Sites/src/build3/build.xml test_popin_kauli_lastview\|echo 'done'<CR>
nnoremap <silent> <C-l>c :<C-u>silent make -f ~/Sites/custom/build/build.xml test_custom\|echo 'done'<CR>
nnoremap <silent> <C-l>d :<C-u>silent make -f ~/Sites/custom/build/build.xml test_discovery\|echo 'discovery done'<CR>
nnoremap <silent> <C-l>m :<C-u>silent make -f ~/Sites/custom/build/build.xml test_mobile_plugin\|echo 'done'<CR>
nnoremap <silent> <C-l>s :<C-u>silent make -f ~/Sites/custom/build/build.xml test_media_search\|echo 'done'<CR>
nnoremap <silent> <C-l>a :<C-u>silent make -f ~/Sites/custom/build/build.xml test_action\|echo 'done'<CR>
nnoremap <silent> <C-l>r :<C-u>silent make -f ~/Sites/custom/build/build.xml test_read\|echo 'done'<CR>
nnoremap <silent> <C-l>3 :<C-u>silent make -f ~/Sites/custom/build/build.xml test_recommend\|echo 'done'<CR>
nnoremap <silent> <C-l>f :<C-u>silent make -f ~/Sites/custom/build/build.xml test_favorite\|echo 'done'<CR>


vnoremap <Leader>e "xx:call <SID>EscapeXml()<CR>"xP

function! s:EscapeXml()
  let @x = substitute(@x, '&', '\&amp;', 'g')
  let @x = substitute(@x, '<', '\&lt;', 'g')
  let @x = substitute(@x, '>', '\&gt;', 'g')
  let @x = substitute(@x, "'", '\&apos;', 'g')
  let @x = substitute(@x, '"', '\&quot;', 'g')
endfunction

" 時間挿入
function! GetCurrentTime()
  return strftime("Update at %H:%M:%S", localtime())
endfunction
"noremap <C-t>n a<C-R>=GetCurrentTime()<CR><Esc>

"for design
set t_Co=256
"colorscheme desert
set background=dark
"colorscheme yuroyoro256
"colorscheme wombat256mod
"if g:colors_name ==? 'wombat'
hi Visual gui=none guifg=khaki guibg=olivedrab
"endif
colorscheme	kolor

"コマンド実行中は再描画しない
set lazyredraw
"高速ターミナル接続を行う
set ttyfast

"for mac vim
autocmd VimLeave * macaction terminate:

"for fav star
let g:favstar_user="ArcCosine"

"for vimshell
let $PATH = $PATH . '/opt/local/bin:/opt/local/sbin:HOME/.rvm/bin'
let g:vimshell_enable_transient_user_prompt=1

nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
	nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
	nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
	nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
	wincmd p
	exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }                     
function! my_action.func(candidates)
	wincmd p
	exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

"" vim-quickrun
let g:quickrun_config = {
\	'rb' : {
\		'command' : 'ruby',
\		'runner' : 'vimproc',
\		'exec' : '%c %s'
\	},
\	'javascript' : {
\		'command' : 'ant',
\		'runner' : 'vimproc',
\       'hook/cd/enable' : 1,
\       'hook/cd/directory' : '~/Sites/custom/build',
\       'cmdopt' : '-f ~/Sites/custom/build/build.xml test_suggestion',
\		'exec' : '%c %o'
\	},
\}
"\   'php.unit' : {
"\		'runner' : 'vimproc',
"\		'runner/vimproc/updatetime' : '100',
"\       'command' : 'phpunit',
"\       'outputter' : 'phpunit_outputter',
"\   }
"\}


"\       'cmdopt' : '-f ~/Sites/custom/build/build.xml test_discovery',

"for phpunit
"augroup QuickRunPHPUnit
    "autocmd!
    "autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
"augroup END


" make outputter for coloring output message.
"let phpunit_outputter = quickrun#outputter#buffer#new()
"function! phpunit_outputter.init(session)
"	" call original process
"	call call(quickrun#outputter#buffer#new().init, [a:session], self)
"endfunction
"
"function! phpunit_outputter.finish(session)
"    " set color 
"    highlight default PhpUnitOK         ctermbg=Green ctermfg=White
"    highlight default PhpUnitFail       ctermbg=Red   ctermfg=White
"    highlight default PhpUnitAssertFail ctermfg=Red
"    call matchadd("PhpUnitFail","^FAILURES.*$")
"    call matchadd("PhpUnitOK","^OK.*$")
"    call matchadd("PhpUnitAssertFail","^Failed.*$")
"    call call(quickrun#outputter#buffer#new().finish, [a:session], self)
"endfunction
"
"" regist outputter to quickrun
"call quickrun#register_outputter("phpunit_outputter", phpunit_outputter)


"For ruby
let g:quickrun_config['ruby'] = {
\		'command': 'ruby',
\		'exec': '$rvm_bin_path/ruby %s',
\		'tempfile': '{tempname()}.rb'
\	}

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

"for gmail
let g:gmail_user_name = 'm.ksdcom@gmail.com'

"for markdown
nnoremap \m :call DisplayMarkdown()<CR>
function! DisplayMarkdown()
    !perl ~/Markdown/Markdown.pl --html4tags "%" > /tmp/__markdown.html;
    vert split /tmp/__markdown.html
    call cursor(1,1)
endfunction

"for vim-ref
let g:ref_phpmanual_path = '/Users/sou/manual/php/php-chunked-xhtml'

"For ctrlp
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く

"for powerline
"let g:Powerline_symbols='fancy'

" lightline.vim
let g:lightline = {
        \ 'colorscheme': 'landscape',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     ['mode', 'paste'],
        \     ['fugitive', 'gitgutter', 'filename'],
        \   ],
        \   'right': [
        \     ['lineinfo', 'syntastic'],
        \     ['percent'],
        \     ['charcode', 'fileformat', 'fileencoding', 'filetype'],
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
        \   'mode': 'MyMode',
        \   'syntastic': 'SyntasticStatuslineFlag',
        \   'charcode': 'MyCharCode',
        \   'gitgutter': 'MyGitGutter',
        \ },
        \ 'separator': {'left': '⮀', 'right': '⮂'},
        \ 'subseparator': {'left': '⮁', 'right': '⮃'}
        \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &ro ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? substitute(b:vimshell.current_dir,expand('~'),'~','') :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? '⭠ '._ : ''
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

" https://github.com/Lokaltog/vim-powerline/blob/develop/autoload/Powerline/Functions.vim
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

" for weather.vim
let g:weather_city_name = '東京'

" for ime off
inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
