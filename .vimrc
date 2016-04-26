set nu
syntax on
set t_Co=256
set backspace=2
set background=dark
colorscheme jellybeans
syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"语言设置
set encoding=utf-8  
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936  
set fileencodings=utf-8,ucs-bom,chinese
set langmenu=zh_CN.UTF-8 
"打开vim时自动回到上次退出时的光标位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 修改leader键
let mapleader = ','
let g:mapleader = ','
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "use vundle to manage plugin 
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括vundle和初始化相关的runtime path
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
" " 另一种选择, 指定一个vundle安装插件的路径
" "call vundle#begin('~/some/path/here')
"
" " 让vundle管理插件版本,必须
 Plugin 'VundleVim/Vundle.vim'

 " My Bundles here: /* 插件配置格式 */
 "==============================================================
 " " original repos on github
 " （Github网站上非vim-scripts仓库的插件，按下面格式填写）
 " Bundle 'tpope/vim-fugitive'
 " -----------------------------------------------------------------
" vim-scripts repos （vim-scripts仓库里的，按下面格式填写）
" Bundle 'FuzzyFinder'
" -----------------------------------------------------------------
 " " non github repos （非上面两种情况的，按下面格式填写）
 " Bundle 'git://git.wincent.com/command-t.git' 
"===============================================================
"
"
"===============================================================
Plugin 'scrooloose/nerdtree'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Long config in detail ,I put it in the end  |
"                                           \ /
"===============================================================
"
"
"=============================================================
 Plugin 'majutsushi/tagbar'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tagbar  Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <Leader>tb :TagbarToggle<CR>               " 快捷键设置
let g:tagbar_ctags_bin='ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
map <F3> :Tagbar<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() "如果是c语言的程序的话，tagbar自动开启
"=================================================================



Plugin 'Valloric/YouCompleteMe.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'   "配置默认的ycm_extra_conf.py
let g:ycm_confirm_extra_conf=0    "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F4> :YcmDiags<CR>

"================================================================
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme="murmur"
 "打开tabline功能,方便查看Buffer和切换，这个功能比较不错"
  "我还省去了minibufexpl插件，因为我习惯在1个Tab下用多个buffer"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>


" 关闭状态显示空白符号计数,这个对我用处不大"
" let g:airline#extensions#whitespace#enabled = 0
 " let g:airline#extensions#whitespace#symbol = '!'

"==================================================================



"==================================================================
Plugin 'easymotion/vim-easymotion'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:EasyMotion_smartcase = 1
 map <Leader><leader>h <Plug>(easymotion-linebackward)
 map <Leader><Leader>j <Plug>(easymotion-j)
 map <Leader><Leader>k <Plug>(easymotion-k)
 map <Leader><leader>l <Plug>(easymotion-lineforward)
 map <Leader><leader>. <Plug>(easymotion-repeat)
 let g:EasyMotion_startofline = 0
"==================================================================


"==================
 Plugin 'scrooloose/syntastic.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"======================================================================


"==================================================================
 Plugin 'taglist.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"==================================================================
 Plugin 'c.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Long config in detail ,I put it in the end  |
"                                           \ /
"===============================================================
  Plugin 'a.vim'

 call vundle#end()            " 必须你的所有插件需要加在这行之前
 filetype plugin indent on    " 必须
" 加载vim自带和插件相应的语法和文件类型相关脚本
" " 忽视插件改变缩进,可以使用以下替代:
" "filetype plugin on
" "
" " 简要帮助文档
" " :PluginList       - 列出所有已配置的插件
" " :PluginInstall    - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" " :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" " :PluginClean      - 清除未使用插件,需要确认; 追加 `!`
" 自动批准移除未使用插件
" "
" " 查阅 :h vundle 获取更多细节和wiki以及FAQ

"""""""""""""""""""""""""""
"plugin taglist setup
"""""""""""""""""""""""""""

"map <F3> :TlistToggle<CR>               " 快捷键设置
"let Tlist_Ctags_Cmd='ctags'
"let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
"let Tlist_WinWidt =28                    "设置taglist的宽度
"let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window=1            "在右侧窗口中显示taglist窗口
"let Tlist_Use_Left_Window=1                "在左侧窗口中显示taglist窗口
"""""""""""""""""""""""""""
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>   "ctags 快捷键

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdTree Setup 用于浏览文件系统的树形资源管理
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos='left'
"显示增强
let NERDChristmasTree=1

"自动调整焦点
let NERDTreeAutoCenter=1
  
"鼠标模式:目录单击,文件双击
let NERDTreeMouseMode=2
   
"打开文件后自动关闭
let NERDTreeQuitOnOpen=1
   
"显示文件
let NERDTreeShowFiles=1
     
"显示隐藏文件
"let NERDTreeShowHidden=1
      
"高亮显示当前文件或目录
let NERDTreeHightCursorline=1
       
"显示行号
let NERDTreeShowLineNumbers=1

"窗口位置
let NERDTreeWinPos='left'

"窗口宽度
let NERDTreeWinSize=31
          
"不显示'Bookmarks' label 'Press ? for help'
"let NERDTreeMinimalUI=1
           
"快捷键
nnoremap <silent> <F2> :NERDTreeToggle<CR>


