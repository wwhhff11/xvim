if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

"主题"
colorscheme solarized
set background=light

"ctrl+n 打开目录 ctrl+w 切换窗口焦点"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
filetype indent on 
set cursorline 
hi CursorLine cterm=NONE ctermbg=white
map <C-n> :NERDTreeToggle<CR>

"目录支持git"
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

let g:go_version_warning = 0

" fmt
let g:clang_format#auto_format_on_insert_leave=1    "退出插入模式时自动格式化

" python
set filetype=python
au BufNewFile,BufRead *.py,*.pyw setf python
set autoindent " same level indent
set smartindent " next level indent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" header
"auto add pyhton header --start
autocmd BufNewFile *.py 0r ~/.vim/vim_template/vim_pyhton_header
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    if line("$") > 10
        let l = 10  "这里是字母L 不是数字1
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
       "最前面是数字1，这里的File Name: 要和模板中一致
endfun

fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
        "这里Create Time: 要和模板中一致
endfun
"auto add python header --end

