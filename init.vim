call plug#begin('~/.config/nvim/plugged')
let g:plug_url_format = 'git@github.com:%s.git'

" ==========================================
" nerdtree目录树插件
" ==========================================
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
" width
:let g:NERDTreeWinSize=20

nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
autocmd VimEnter * NERDTreeFocus
wincmd w
autocmd VimEnter * wincmd w
" ==========================================


" ==========================================
" tagbar
" ==========================================
Plug 'majutsushi/tagbar'
:let g:tagbar_width=30
nnoremap <F8> :TagbarToggle<CR>
autocmd VimEnter * TagbarToggle
" ==========================================


Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
nnoremap <C-n> :BufferNext<CR>

" ==========================================
" 设置主题
" ==========================================
Plug 'sainnhe/sonokai'

if has('termguicolors')
    set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1
" ==========================================

" ==========================================
" 状态栏
" ==========================================
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ==========================================


" ==========================================
" 开屏页面优化
" ==========================================
Plug 'mhinz/vim-startify'
" ==========================================


" Plug 'TaDaa/vimade'

" ==========================================
" 其他全局配置
" ==========================================
: set nu
: set mouse=a
: set cursorline
: set wrap
: set hlsearch
: set ts=4
: set expandtab
: set shiftwidth=4
: set encoding=utf8
: set fileencodings=ucs-bom,utf-8,cp936
: set termencoding=utf8
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
func SetTitle()
    if expand("%:e") == "py"
        call PythonHead()
    elseif expand("%:e") == "cpp"
        call CppHead()
    elseif expand("%:e") == 'h'
        call HFileHead()
    elseif expand("%:e") == 'sh'
        call ShellHead()
    endif
endfunc

"map <F4> :call SetTitle() <cr>'s
autocmd BufNewFile *.py,*.[ch],*.hpp,*.cpp,Makefile,*.mk,*.sh exec ":call SetTitle()"
""" 自动添加python注释
func PythonHead()
    call append(0, "\#!/usr/bin/env python")
    call append(1, "\# -*- coding: utf-8 -*-")
    call append(2, "\"\"\"")
    call append(3, "  Author     : hexueyuan")
    call append(4, "  Update time: ".strftime("%c"))
    call append(5, "  File       : ".expand("%"))
    call append(6, "  Desc       : ")
    call append(7, "\"\"\"")
    call append(8, "")
endfunc

func CppHead()
    call append(0, "\/***************************************************************************************************")
    call append(1,  " * author: hexueyuan")
    call append(2,  " * create: ".strftime("%c"))
    call append(3,  " * file  : ".expand("%"))
    call append(4,  " * description: ")
    call append(5,  "***************************************************************************************************\/")
endfunc

func HFileHead()
    call append(0, "\/***************************************************************************************************")
    call append(1,  " * author: hexueyuan")
    call append(2,  " * create: ".strftime("%c"))
    call append(3,  " * file  : ".expand("%"))
    call append(4,  " * description: ")
    call append(6,  "***************************************************************************************************\/")
    call append(7,  "#pragma once")
    call append(8, "")
    call append(9, "")
endfunc

func ShellHead()
    call append(0, "\#!/bin/bash")
    call append(1, "\#==================================================================================================#")
    call append(2, "\# author: hexueyuan")
    call append(3, "\# date  : ".strftime("%c"))
    call append(4, "\# file  : ".expand("%"))
    call append(5, "\# description: ")
    call append(6, "\#==================================================================================================#")
endfunc
" ==========================================

call plug#end()

colorscheme sonokai
