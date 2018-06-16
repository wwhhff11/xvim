if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
let g:NERDTreeShowIgnoredStatus = 1
