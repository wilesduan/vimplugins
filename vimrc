set number
set syntax=on
set autoindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nobackup
set hlsearch
set incsearch
set cmdheight=2

syntax on
syntax enable
filetype on
set smartindent


map <silent> <leader>ss :source ~/.vimrc<cr>

nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'git://github.com/majutsushi/tagbar.git'
Plugin 'git://github.com:skywind3000/asyncrun.vim.git'
Plugin 'git@github.com:flazz/vim-colorschemes.git'
Plugin 'git@github.com:mhartington/oceanic-next.git'
Plugin 'git@github.com:fatih/vim-go.git'
Plugin 'git@github.com:Valloric/YouCompleteMe.git'
call vundle#end() 

nmap <F12> <esc>:call RunCtags()
func! RunCtags()
    wall
    let g:Curr_dir=getcwd()
    let i = 1
    while i < 10
        if filereadable("tags")
            exec "!ctags -R ."
            break
        else
            cd ..
            let i += 1
        endif
    endwhile
    exec 'cd'.g:Curr_dir
endfunc

:nmap <F2> :colorscheme monokain<CR>
map<F3>:call CompileRunGcc()
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! ./%<"
endfunc

map<F4>:call CompileRunGpp()
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc

:nmap <F5> :TagbarToggle<CR>
let g:tagbar_autoshowtag = 1
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_sort = 0
autocmd VimEnter * nested TagbarOpen

:imap <tab> <c-x><c-o>
:nmap <tab> <c-w><c-w>

let NERDChristmasTree = 1
:nmap <F6> :NERDTreeToggle<cr>
let NERDTreeWinPos="right"
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
:nnoremap <silent> <F3> :Grep<CR>
:nnoremap <silent> <c-x><c-f> :Grep<CR>

:nmap qa :qa<CR>

filetype on
filetype plugin on
filetype indent on
let g:indexer_disableCtagsWarning=1
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
				\| exe "normal g'\"" | endif
endif


"call plug#begin('~/.vim/plugged')
"Plug 'fatih/vim-go', { 'tag': '*' }
"call plug#end()

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
		\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
		\ }

let g:godef_split=0

let g:bufExplorerSplitVertSize = 30 
let g:bufExplorerShowRelativePath=1

if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	if filereadable("cscope.out")
	    cs add cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

func! PhpAlign() range
	let l:paste = &g:paste
	let &g:paste = 0

	let l:line        = a:firstline
	let l:endline     = a:lastline
	let l:maxlength = 0
	while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
		let l:index = substitute (getline (l:line),'^\s*\(.\{-\}\)\s*\S\{0,1}=\S\{0,1\}\s.*$', '\1', "")
		let l:indexlength = strlen (l:index)
		let l:maxlength = l:indexlength > l:maxlength ? l:indexlength :l:maxlength
		let l:line = l:line + 1
	endwhile

	let l:line = a:firstline
	let l:format = "%s%-" . l:maxlength . "s %s %s"

	while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
		let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
		let l:linekey   = substitute (getline (l:line),'^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\1', "")
		let l:linesep   = substitute (getline (l:line),'^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\2', "")
		let l:linevalue = substitute (getline (l:line),'^\s*\(.\{-\}\)\s*\(\S\{0,1}=\S\{0,1\}\)\s\(.*\)$', '\3', "")

		let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep,l:linevalue)
		call setline (l:line, l:newline)
		let l:line = l:line + 1
	endwhile
	let &g:paste = l:paste
endfunc

"inoremap <buffer> <C-H> <ESC>:!/home/wilesduan/.vim/phpm/phpm <C-R>=expand("<cword>")<CR><CR>
"
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_auto_add_gtags_cscope = 0
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif

let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxI']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

augroup vimrc
	autocmd User AsyncRunStart call asyncrun#quickfix_toggle(10, 1)
augroup END

set t_Co=256
colorscheme monokain
