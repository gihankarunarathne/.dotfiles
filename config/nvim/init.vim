" ensure vim-plug is installed and then load it
call functions#PlugLoad()
call plug#begin('~/.config/nvim/plugged')

" General {{{
    abbr funciton function
    abbr cosnt const

    set autoread " detect when a file is changed

    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

    if (has('nvim'))
        " show results of substition as they're happening
        " but don't open a split
        set inccommand=nosplit
    endif
" }}}

" Appearance {{{
    set number " show line numbers
" }}}

" General Mappings {{{
    " set a map leader for more key combos
    let mapleader = ','

    " remap esc
    inoremap jk <esc>

    " shortcut to save
    nmap <leader>, :w<cr>

    " edit ~/.config/nvim/init.vim
    map <leader>ev :e! ~/.config/nvim/init.vim<cr>
" }}}

" General Functionality {{{
    " NERDTree {{{
        Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
        Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'ryanoasis/vim-devicons'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
        let g:WebDevIconsOS = 'Darwin'
        let g:WebDevIconsUnicodeDecorateFolderNodes = 1
        let g:DevIconsEnableFoldersOpenClose = 1
        let g:DevIconsEnableFolderExtensionPatternMatching = 1
        let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
        let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
        let NERDTreeNodeDelimiter = "\u263a" " smiley face

        augroup nerdtree
            autocmd!
            autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
            autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
        augroup END

        " Toggle NERDTree
        function! ToggleNerdTree()
            if @% != "" && @% !~ "Startify" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
                :NERDTreeFind
            else
                :NERDTreeToggle
            endif
        endfunction
        " toggle nerd tree
        nmap <silent> <leader>n :call ToggleNerdTree()<cr>
        " find the current file in nerdtree without needing to reload the drawer
        nmap <silent> <leader>y :NERDTreeFind<cr>

        let NERDTreeShowHidden=1
        " let NERDTreeDirArrowExpandable = '▷'
        " let NERDTreeDirArrowCollapsible = '▼'
        let g:NERDTreeIndicatorMapCustom = {
        \ "Modified"  : "✹",
        \ "Staged"    : "✚",
        \ "Untracked" : "✭",
        \ "Renamed"   : "➜",
        \ "Unmerged"  : "═",
        \ "Deleted"   : "✖",
        \ "Dirty"     : "✗",
        \ "Clean"     : "✔︎",
        \ 'Ignored'   : '☒',
        \ "Unknown"   : "?"
        \ }
    " }}}
" }}}

" Language-Specific Configuration {{{
    " html / templates {{{

    " }}}
" }}}

call plug#end()

