" 依赖的软件
" nodejs, npm, ripgrep, clang, ctags, zathura-pdf-mupdf, texlive-most,
" texlive-lang, remote-neovim

" 设置vim-plug插件安装路径
let g:plugins_path = $HOME.'/.cache/vim/plugins'

call plug#begin(g:plugins_path)

" 补全类插件
" Plug 'neovim/nvim-lsp'
" Plug 'ycm-core/YouCompleteMe'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" 检索类插件
Plug 'junegunn/fzf', { 'do': './install --bin' } |
\ Plug 'junegunn/fzf.vim' |
\ Plug 'tpope/vim-fugitive'

" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' } |
"\ Plug 'vn-ki/coc-clap' |
"\ Plug 'liuchengxu/vista.vim'

" latex插件
Plug 'lervag/vimtex', {'for': 'tex'}

" 文档类插件
" Plug 'scrooloose/nerdcommenter'
Plug 'tyru/caw.vim'
" 生成注释文档, 不适用默认的映射，这样启动更快
Plug 'kkoomen/vim-doge', {'on': ['DogeGenerate']}
" vim中文文档
Plug 'yianwillis/vimcdoc'

" 主题类插件
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'
" 彩虹括号
Plug 'luochen1990/rainbow'
" 底栏
Plug 'itchyny/lightline.vim'
" 关灯读小说
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } |
\ Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" 高亮类插件
Plug 'sheerun/vim-polyglot'
" python高亮，异步
if has('nvim')
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins', 'for': 'python'}
endif
" c++ 高亮
Plug 'jackguo380/vim-lsp-cxx-highlight', {
            \ 'for': [
            \ 'cpp', 'c', 'cu', 'h', 'hpp', 'hh', 'objc', 'objcpp'
            \ ]}

" 函数列表
Plug 'liuchengxu/vista.vim', {'on': ['Vista!!', 'Vista']}
" 自动补全括号
Plug 'jiangmiao/auto-pairs'
" 快速包围
Plug 'tpope/vim-surround'
" 重复上次的动作
Plug 'tpope/vim-repeat'
" 尾部空格
Plug 'ntpeters/vim-better-whitespace'
" 代码段
Plug 'honza/vim-snippets'
" 代码段同步更改
" Plug 'SirVer/ultisnips'
" 快速跳转窗口
Plug 't9md/vim-choosewin',  { 'on': 'ChooseWin' }
" 快速移动
" Plug 'rhysd/clever-f.vim'
Plug 'easymotion/vim-easymotion', {'on':
            \ [
            \ '<Plug>(easymotion-bd-f)', '<Plug>(easymotion-overwin-f)',
            \ '<Plug>(easymotion-overwin-f2)', '<Plug>(easymotion-bd-jk)',
            \ '<Plug>(easymotion-overwin-line)', '<Plug>(easymotion-bd-w)',
            \ '<Plug>(easymotion-overwin-w)'
            \ ]}
" Plug 'unblevable/quick-scope'
" 对齐
Plug 'junegunn/vim-easy-align'
" 对齐线
Plug 'Yggdroot/indentLine'
" 多光标
Plug 'mg979/vim-visual-multi'
" csv
Plug 'chrisbra/csv.vim', {'for': 'csv'}
Plug 'voldikss/vim-floaterm', {'on':
            \[
            \ 'FloatermNew', 'FloatermToggle'
            \ ]}
Plug 'vimwiki/vimwiki'
" 功能很强的折叠插件, zc zo
Plug 'pseewald/vim-anyfold'
Plug 'mhinz/vim-startify'
" 翻译
" Plug 'voldikss/vim-translator'
Plug 'iamcco/dict.vim', {'on':
            \ [
            \ '<Plug>DictSearch', '<Plug>DictVSearch', '<Plug>DictWSearch',
            \ '<Plug>DictWVSearch', '<Plug>DictRSearch', '<Plug>DictRVSearch'
            \ ]}
" tmux与vim窗口导航
Plug 'christoomey/vim-tmux-navigator'
" 平滑滚动
Plug 'psliwka/vim-smoothie'
" 放大窗口
Plug 'troydm/zoomwintab.vim', {'on': 'ZoomWinTabToggle'}
" ranger
Plug 'francoiscabrol/ranger.vim', {'on':
            \ [
            \ 'RangerCurrentFile', 'RangerWorkingDirectory'
            \ ]}
" buffer close
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
" 二进制
Plug 'Shougo/vinarise.vim', { 'on': 'Vinarise' }
" 编译运行
" Plug 'skywind3000/asynctasks.vim', {'on': ['AsyncTask','AsyncTaskEdit','AsyncTaskList','AsyncTaskMarco', 'AsyncTaskProfile']}
" Plug 'skywind3000/asyncrun.vim', {'on': ['AsyncRun', 'AsyncStop']}
" debug
" Plug 'puremourning/vimspector'
" markdown内运行代码
" Plug 'gpanders/vim-medieval', {'on': ['Eval', 'Eval!', 'EvalBlock!', 'EvalBlock']}
" Plug 'dbridges/vim-markdown-runner'
" 数据库
" Plug 'tpope/vim-dadbod', {'on': 'DB'}
" 书签
" Plug 'MattesGroeger/vim-bookmarks', {'on': ['BookmarkToggle', 'BookmarkAnnotate', 'BookmarkShowAll', 'BookmarkClear', 'BookmarkClearAll']}
" 画图，使用leaderds结束
" Plug 'davinche/DrawIt', {'on': 'DrawIt'}
" jk加速
" Plug 'rhysd/accelerated-jk'
" 输入法切换
" Plug 'rlue/vim-barbaric'
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}

call plug#end()

" 判断该插件是否已经安装
fun! HasInstall(plugin_name) abort
    let s:plugin_path = g:plugins_path . "/" . a:plugin_name
    if !empty(glob(s:plugin_path))
        return v:true
    else
        return v:false
    endif
endfunction

" 判断插件列表是否有这个插件
fun! HasPlug(plugName)
    if index(g:plugs_order, a:plugName) > -1
        return v:true
    else
        return v:false
    endif
endfunction
