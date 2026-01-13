set nocompatible

let g:loaded_colorresp = 1

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'

Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
call plug#end()

set autoindent
set backspace=indent,eol,start
set formatoptions-=t
set hlsearch
set nostartofline
set ruler
set showmatch
set showcmd
set showmode
set tabstop=8
set textwidth=80
set title
set relativenumber
set noswapfile

set background=light
hi Comment ctermfg=63

" ---------------------------------------------
" File/Indenting and Syntax Highlighting | from: https://github.com/bahamas10/dotfiles/blob/master/vimrc
" ---------------------------------------------
if has("autocmd")
	filetype plugin indent on

	" Jump to previous cursor location, unless it's a commit message
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
	autocmd BufReadPost COMMIT_EDITMSG exe "normal! gg"

	" Chef/Ruby
	autocmd BufNewFile,BufRead                  *.rb setlocal filetype=ruby
	autocmd FileType                            ruby setlocal sw=2 sts=2 et

	" Yaml
	autocmd BufNewFile,BufRead                  *.yaml,*.yml setlocal filetype=yaml
	autocmd FileType                            yaml         setlocal sw=2 sts=2 et

	" JavaScript files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.js        setlocal filetype=javascript
	autocmd FileType                            javascript  setlocal sw=4 sts=4 et

	" JSON files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.json setlocal filetype=json
	autocmd FileType                            json   setlocal sw=2 sts=2 et

	" Objective C / C++
	autocmd BufNewFile,BufReadPre,FileReadPre   *.m    setlocal filetype=objc
	autocmd FileType                            objc   setlocal sw=4 sts=4 et
	autocmd BufNewFile,BufReadPre,FileReadPre   *.mm   setlocal filetype=objcpp
	autocmd FileType                            objcpp setlocal sw=4 sts=4 et

	" Rust files
	" autocmd BufNewFile,BufReadPre,FileReadPre   *.rs   setlocal filetype=rust
	autocmd FileType                            rust   setlocal sw=4 sts=4 et textwidth=80

	" Python files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.py   setlocal filetype=python
	autocmd FileType                            python setlocal sw=4 sts=4 et

	" Markdown files
	autocmd BufNewFile,BufRead,FileReadPre      *.md,*.markdown setlocal filetype=markdown
	autocmd FileType                            markdown      setlocal sw=4 sts=4 et spell
	" Jekyll posts ignore yaml headers
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax match Comment /\%^---\_.\{-}---$/
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax region lqdHighlight start=/^{%\s*highlight\(\s\+\w\+\)\{0,1}\s*%}$/ end=/{%\s*endhighlight\s*%}/

	" EJS javascript templates
	autocmd BufNewFile,BufRead,FileReadPre      *.ejs setlocal filetype=html

	" TXT files
	autocmd FileType                            text setlocal spell
endif

highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/

set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout cterm=underline ctermfg=red
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

let g:airline_powerline_fonts = 0
let g:airline_theme = "deus"
let g:rust_recommended_style = 1
let g:ale_linters = {
\ 'bash': [],
\ 'sh': [],
\ 'c': [],
\ 'rust': ['analyzer'],
\}
let g:ale_completion_enabled = 0
let g:vim_markdown_folding_disabled = 1

nnoremap <leader>e <CMD>Explore<CR>
