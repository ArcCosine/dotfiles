""
" For Cygwin Version _vimrc
" Since 2011.11.24

""""""""""""""""""""""""""""""

filetype on 
filetype indent on
syntax enable

"for cygwin
set shellslash

"Show line number
set number

"No backup
set nobackup

"Copy to clipboard
"set clipboard=unnamed

"No save buffer
set hidden
set noswapfile

"Enable modeline
"set modeline

"view status
set laststatus=2
set noshowmode

" Use backspace for insert mode.
set backspace=indent,eol,start


"for bundle
" be iMproved
set nocompatible
filetype off     " required!

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {'build' :{
			\'cygwin' : 'make -f make_cygwin.mak',
			\'mac' : 'make -f make_mac.mak',
			\'unix' : 'make -f make_unix.mak',
			\},
			\}

"NeoBundle 'vim-scripts/project.tar.gz'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/git-vim'
"NeoBundle 'Shougo/vimfiler'
NeoBundle 'tpope/vim-surround'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mattn/favstar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'teramako/jscomplete-vim'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'koron/chalice'
"NeoBundle 'JavaScript-syntax'
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'Lokaltog/powerline'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'vim-scripts/vcscommand.vim'
"NeoBundle 'Wombat'
"NeoBundle 'wombat256.vim'
"NeoBundle 'hrsh7th/vim-unite-vcs'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'basyura/twibill.vim'
NeoBundle 'basyura/TweetVim'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'hallison/vim-markdown'
"NeoBundle 'fuenor/qfixhowm'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'yuratomo/gmail.vim'
"NeoBundle 'rainux/vim-desert-warm-256'
NeoBundle 'zeis/vim-kolor'
"NeoBundle 'matchit.zip'
"NeoBundle 'ruby-matchit'
NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'migemo'
NeoBundle 'yuratomo/weather.vim'
NeoBundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
NeoBundle 'junegunn/seoul256.vim'
NeoBundle 'mattn/habatobi-vim'
NeoBundle 'kannokanno/previm'
"NeoBundle 'Markdown'
"NeoBundle 'supermomonga/vimshell-pure.vim', {'depends' : 'Shougo/vimshell.vim'}

filetype plugin indent on     " required!

if neobundle#exists_not_installed_bundles()
	echomsg 'Not installed bundles : ' .
				\ string(neobundle#get_not_installed_bundle_names())
	echomsg 'Please execute ":NeoBundleInstall" command.'
	finish
endif

"For vimfiler
let g:vimfiler_as_default_explorer = 1


"Zen Coding用
let g:user_zen_settings = {
\'lang': "ja"
\}


"for smart char
inoremap <expr> = search('\(&\<Bar><Bar>\<Bar>+\<Bar>-\<Bar>/\<Bar>>\<Bar><\) \%#', 'bcn')? '<bs>= '
    \ : search('\(*\<Bar>!\)\%#', 'bcn') ? '= '
    \ : smartchr#one_of('=',' = ', ' == ', ' === ')


"" reloadable vimrc
nnoremap <silent> ,r :<C-u>source $MYVIMRC<CR>

"" for unite
" start edit mode
let g:unite_enable_start_insert=0

"Key Mapping

"From kana_1's vimrc
command! -nargs=* Cnmap  call s:cmd_Cmap('n', '', [<f-args>])

function! s:cmd_Cmap(prefix, suffix, args)
	" FIXME: This parsing may not be compatible with the original one.
	let [options, rest] = s:separate_list(a:args,
	\ '^\c<\(buffer\|expr\|script\|silent\|special\|unique\|count\|noexec\)>$')
	if len(rest) < 2
		throw 'Insufficient number of arguments: ' . string(rest)
	endif
	let lhs = rest[0]
	let script = rest[1:]
	let count_p = s:contains_p(options, '^\c<count>$')
	let noexec_p = s:contains_p(options,'^\c<noexec>>$')
	call filter(options, 'v:val !~# ''^\c<\(count\|noexex\)>$''')

	execute a:prefix.'noremap'.a:suffix join(options) lhs
	\ ':'.(count_p ? '' : '<C-u>') . join(script) . (noexec_p ? '' : '<Return>')
endfunction


"色々
let s:FALSE = 0
let s:TRUE = !s:FALSE

function! s:separate_list(list, regexp)
	let i = 0
	while i < len(a:list) && a:list[i] =~# a:regexp
		let i += 1
	endwhile
	return [(0 < i ? a:list[:i-1] : []), a:list[(i):]]
endfunction


function! s:contains_p(list, regexp)
	for item in a:list
		if item =~# a:regexp
			return s:TRUE
		endif
	endfor
	return s:FALSE
endfunction


function! s:count(...)
	if v:count == v:count1  " is count given?
		return v:count
	else  " count isn't given.  (the default '' is useful for
		special value)
		return a:0 == 0 ? '' : a:1
	endif
endfunction

nnoremap <SID>[ug] <Nop>
nmap ,u <SID>[ug]


"Show buffer
nnoremap <silent> <SID>[ug]b :<C-u>Unite buffer<CR>
"Show files
nnoremap <silent> <SID>[ug]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
"Show register
nnoremap <silent> <SID>[ug]r :<C-u>Unite -buffer-name=register register<CR>
"Recently used files
nnoremap <silent> <SID>[ug]m :<C-u>Unite file_mru -default-action=tabopen<CR>
"Regular set
nnoremap <silent> <SID>[ug]u :<C-u>Unite buffer file_mru -default-action=tabopen<CR>
"All set
nnoremap <silent> <SID>[ug]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file -default-action=tabopen<CR>
"Bookmark
nnoremap <silent> <SID>[ug]k :<C-u>Unite bookmark<CR>
"Yank history
nnoremap <silent> <SID>[ug]y :<C-u>Unite history/yank<CR>


"for vcs/log
nnoremap <silent> <SID>[ug]l :<C-u>Unite vcs/log<CR>
nnoremap <silent> <SID>[ug]c :<C-u>Unite vcs/commit<CR>

"for tweetvim
nnoremap <silent> <SID>[ug]t :<C-u>Unite tweetvim<CR>
nnoremap <silent> <SID>[ug]s :<C-u>TweetVimSay<CR>


"for fakeclip
map ;y <Plug>(fakeclip-y)
map ;p <Plug>(fakeclip-p)

"Close Unite
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"新しいウインドウで開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')
au FileType unite inoremap <silent> <buffer> <expr> <C-t> unite#do_action('tabopen')


"For VimShell
set shell=zsh

"for tabstops
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.rhtml set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.yml set tabstop=2 shiftwidth=2
"au BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.js set tabstop=2 shiftwidth=2 ft=javascript fenc=utf-8
au BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2


"for javascript
autocmd FileType javascript set tabstop=2 expandtab shiftwidth=2

" for python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" F5 command history
" F6 search history
nnoremap <F5> <Esc>q:  
nnoremap <F6> <Esc>q/

" ignore q: q/ 
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop> 

" replce
nnoremap <silent> cy ce<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<Esc>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<Esc>:let@/=@1<CR>:noh<CR>

"for tab
" Move new tabpage at the last.
Cnmap <silent> <C-t>n  tabnew \| tabmove
Cnmap <silent> <C-t>c  tabclose
Cnmap <silent> <C-t>C  tabclose!
Cnmap <silent> <C-t>o  tabonly
Cnmap <silent> <C-t>i  tabs

nmap <C-t><C-n>  <C-t>n
nmap <C-t><C-c>  <C-t>c
nmap <C-t><C-o>  <C-t>o
nmap <C-t><C-i>  <C-t>i


Cnmap <silent> <C-t>T  TabpageTitle

" Moving around tabpages.  "{{{3
Cnmap <silent> <C-t>j
			\ execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')
Cnmap <silent> <C-t>k  Qexecute tabprevious [count]
Cnmap <silent> <C-t>K  tabfirst
Cnmap <silent> <C-t>J  tablast

nmap <C-t><C-j>  <C-t>j
nmap <C-t><C-k>  <C-t>k
nmap <C-t><C-t>  <C-t>j


cnoremap <C-a> <Home>
" 一文字戻る
cnoremap <C-b> <Left>
" カーソルの下の文字を削除
cnoremap <C-d> <Del>
" 行末へ移動
cnoremap <C-e> <End>
" 一文字進む
cnoremap <C-f> <Right>
" コマンドライン履歴を一つ進む
cnoremap <C-n> <Down>
" コマンドライン履歴を一つ戻る
cnoremap <C-p> <Up>
" 前の単語へ移動
cnoremap <M-b> <S-Left>
" 次の単語へ移動
cnoremap <M-f> <S-Right>



" For quicfix
autocmd QuickfixCmdPost vimgrep cwin

" For neo snipet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

"no preview
set completeopt-=preview

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

""For neocomplcache
let g:neocomplcache_enable_at_startup = 1 

" let g:neocomplcache_source_disable = {
"  \	'filename_complete' : 1 
"  \}

let g:neocomplcache_min_syntax_length = 3

"Change Current
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
 let l:line = getline('.')
 let l:encoded = AL_urlencode(l:line)
 call setline('.', l:encoded)
endfunction

"from chalice.vim
function! s:URLDecode()
 let l:line = getline('.')
 let l:encoded = AL_urldecode(l:line)
 call setline('.', l:encoded)
endfunction


"escape v
vnoremap <Leader>e "xx:call <SID>EscapeXml('x')<CR>"xP

function! s:EscapeXml(regname)
  let x = getreg(a:regname)
  let x = substitute(x, '&', '\&amp;', 'g')
  let x = substitute(x, '<', '\&lt;', 'g')
  let x = substitute(x, '>', '\&gt;', 'g')
  let x = substitute(x, "'", '\&apos;', 'g')
  let x = substitute(x, '"', '\&quot;', 'g')
  call setreg(a:regname, x)
endfunction

"for favstar
let g:favstar_user = "ArcCosine"

"For favstar
function! s:TwitVimShowFavStar()
	silent! redir => json
	silent! TwitVimShowCurbuffer
	silent! redir END
	let curbuffer = eval(substitute(json, "\n", '', 'g'))
	let id = get(curbuffer.statuses, line('.'))
	if id != 0
		let user = substitute(curbuffer.buffer[line('.')-1], ':.*', '', '')
		exe "FavStar" user id
	endif
endfunction

"favstar keymap
nnoremap <buffer> <leader>F :call <SID>TwitVimShowFavStar()<CR>

" 文字コードの自動認識
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

"set 256 colors
set t_Co=256

"for lucius
"let g:lucius_style = 'dark'
"let g:lucius_contrast = 'highlight'

"color scheme
"colorscheme desert
"colorscheme desert-warm-256
colorscheme	kolor
"colorscheme  seoul256

"For Rectangle Selection
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')

function! s:force_blockwise_visual(next_key)
	if mode() ==# 'v'
		return "\<C-v>" . a:next_key
	elseif mode() ==# 'V'
		return "\<C-v>0o$" . a:next_key
	else  " mode() ==# "\<C-v>"
		return a:next_key
	endif
endfunction


"for markdown
nnoremap \m :call DisplayMarkdown()<CR>
function! DisplayMarkdown()
	!perl ~/Markdown/Markdown.pl --html4tags "%" > /tmp/__markdown.html;
	vert split /tmp/__markdown.html
	call cursor(1,1)
endfunction


"for quickrun
"let g:quickrun_config = {
"\	'md' : {
"\		'command': 'perl',
"\		'cmdopt' : '~/Markdown/Markdown.pl --html4tags "%" > /tmp/__markdown.html',
"\		'exec'   : ['%c %o','vert split /tmp/__markdown.html']
"\	}
"\}

"for rename
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))


"for coffee
"au BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"open-browser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"For open browser
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)

"For gmail
let g:gmail_user_name = 'm.ksdcom@gmail.com'

"For ctrlp
let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く


"fancyテーマに切り替え
let g:Powerline_symbols = 'fancy'


