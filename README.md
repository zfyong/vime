# vime

## About

该项目使用一个插件一个配置文件方式，方便插件的增删，同时也方便配置文件的移植。

将需要安装的插件写到`config/plug.vim`中，然后在`config/plugins`目录下建立与插件同名的配置文件，在该文件中写入自己的配置即可，如果要删除插件，只需要从`config/plug.vim`中删除插件条目即可，`config/plugins`目录下的同名配置文件不再加载。

![vime](./assets/readme1.png)

### 整体结构

```bash
├── coc-settings.json
├── config/
   ├── base.vim
   ├── keymap.vim
   ├── plugins/
   ├── config.vim
   ├── plug.vim
   └── theme.vim
├── init.vim
└── vimrc -> ./init.vim
```

简单了解下整个结构，我用的插件管理器是[junegunn/*vim*-*plug*](https://github.com/junegunn/vim-plug)。

目录结构：

1. `plug.vim`文件就是`vim-plug`的插件配置文件，里面是我们需要的插件列表，写在这里面的插件会加载他的配置，插件的配置在`plugins`目录下，一个插件对应一个文件。注释掉的插件不会加载其配置。
2. `base.vim`用于基础配置
3. `keymap.vim`用于按键映射
4. `theme.vim`用于主题配置
5. `plugins`目录下是所有插件的配置文件，一个插件一个配置文件，只会加载`plug.vim`中安装的插件的配置。
6. `config.vim`用于一些个人配置或全局配置，比如插件的缓存目录，笔记的根目录等

### 简单了解

1. 补全使用的是[neoclide/*coc*.*nvim*](https://github.com/neoclide/coc.nvim)
2. 文件管理使用的是[weirongxu/*coc*-explorer](https://github.com/weirongxu/coc-explorer)
3. 函数浏览器使用的是[liuchengxu/*vista*.*vim*](https://github.com/liuchengxu/vista.vim)

### 依赖

需要安装如下软件：

1. nodejs，npm：必装
2. ripgrep：必装，用于文件内容检索
3. neovim-remote:：可选，vimtex会用到，但是也可以不用，安装体验更好，`pip install neovim-remote`
4. clangd：可选，用于c系补全

### 安装

```bash
git clone https://github.com/fgheng/vime -C .config/nvim
```

然后打开neovim，执行`:PlugInstall`等待插件安装完毕即可！

### 快捷键

不管您选择了哪种补全插件，哪种检索插件，我们的快捷键配置都会尽可能保持一致，无须更改您的使用习惯，改变的只是`neo/vim`表现形式。

#### coc与补全行为

补全使用的[neoclide/*coc.nvim*](https://github.com/neoclide/coc.nvim)插件

| 按键      | 描述                                                         |
| --------- | ------------------------------------------------------------ |
| tab       | 1. 如果存在下拉框，那么选择下一个<br>2. 如果不存在下拉框，那么强制显示下拉框，前提是有内容显示，否则输入tab |
| shift-tab | 如果存在下拉框的话，选择下拉框的上一个                       |
| enter     | 选中下拉框中的该条目，如果条目可以扩展，那么将会扩展         |
| gd        | 跳转到定义                                                   |
| gr        | 跳转到引用                                                   |
| gi        | 跳转到实现                                                   |
| gy        | 跳转到类型定义                                               |
| alt-j     | 1. 正常模式下，跳转到下一处错误<br>2. 存在下拉框，选择下一个条目<br>3. 存在snippet，跳转到下一处补全处 |
| alt-k     | 同alt-j行为相反                                              |
| K         | 查看当前光标下的函数的帮助                                   |

| 按键      | 描述                    |
| --------  | ----------------------- |
| \<space>l | 打开coclist             |
| \<space>a | 打开coclist dialogistic |
| \<space>c | 打开coclist command     |
| \<space>o | 打开coclist outline     |
| \<space>O | 打开coclist symbols     |

#### 窗口与tab操作

| 按键           | 描述                                                         |
| -------------- | ------------------------------------------------------------ |
| ctrl-w-h/j/k/l | 分别在当前窗口的左/下/上/右侧打开一个新的窗口，并将光标移动到新的窗口 |
| ctrl-h/j/k/l   | 分别移动光标到当前窗口的左/下/上/右侧窗口                    |
| alt-H/J/K/L    | 分别移动光标到当前窗口的左/下/上/右侧窗口                    |
| ctrl-w-o       | 最大化当前窗口，再按一次恢复；前提是在`plug.vim`中没有注释掉`zoomwintab.vim`插件， |
| -              | 选择窗口，选择窗口模式下，按s可以交换窗口                    |
| alt-h/l        | 上/下一个tab                                                 |

#### 文件管理

文件管理使用的插件是[weirongxu/*coc*-*explorer*](https://github.com/weirongxu/coc-explorer)、[Shougo/*defx*.nvim](https://github.com/Shougo/defx.nvim)，两者之一，需要在`plug.vim`中选择，快捷键行为基本一致。支持浮动窗口。

同时可以使用<leader>f打开ranger。

| 按键  | 描述                                          |
| ----- | --------------------------------------------- |
| j     | 下一个                                        |
| k     | 上一个                                        |
| h     | 收起目录                                      |
| l     | 展开目录/打开文件                             |
| H     | 递归收起目录                                  |
| L     | 递归打开目录                                  |
| J     | 跳到下一个可以展开的地方                      |
| K     | 跳到上一个可以展开的地方                      |
| enter | 进入目录并切换工作目录为进入的目录            |
| back  | 跳到上一级目并切换工作目录为切换的目录        |
| r     | 刷新目录                                      |
| v     | 选中/取消选中，并向下移动                     |
| V     | 选中/取消选中，并向上移动                     |
| *     | 选中/取消选中                                 |
| sh    | 水平打开                                      |
| sv    | 垂直打开                                      |
| st    | 新tab中打开                                   |
|       |                                               |
| dd    | 剪切文件                                      |
| Y     | 复制文件                                      |
| D     | 删除文件                                      |
| P     | 粘贴文件                                      |
| R     | 重命名文件                                    |
| A     | 添加文件或者目录，如果最后有`/`则表示添加目录 |
| yy    | 复制文件路径                                  |
| y     | 复制文件名称                                  |
| .     | 显示/关闭隐藏文件                             |
|       |                                               |
| x     | 使用系统应用打开文件                          |
| f     | 搜索文件                                      |
| F     | 递归搜索文件                                  |
|       |                                               |

#### buffer与文件检索操作等

该操作主要由[junegunn/*fzf*.vim](https://github.com/junegunn/fzf.vim)、[Yggdroot/*LeaderF*](https://github.com/Yggdroot/LeaderF)、[neoclide/*coc*.*nvim*](https://github.com/neoclide/coc.nvim)三者中的一个完成，快捷键基本一致，主要看`plug.vim`中选择的是哪一个插件，其中[neoclide/*coc*.*nvim*](https://github.com/neoclide/coc.nvim)优先级最低，有其他两者，那么就会覆盖掉coc的操作。

| 按键  | 描述                                                         |
| ----- | ------------------------------------------------------------ |
| alt-r | 最近打开的文件                                               |
| alt-b | 显示当前打开的所有buffer                                     |
| alt-f | 搜索工程目录下的文件                                         |
| alt-F | 搜索HOME下的所有文件                                         |
| alt-w | 显示打开的窗口                                               |
| alt-m | 显示所有的标记                                               |
| alt-M | 显示所有映射                                                 |
| alt-s | 1. 使用rg搜索当前工程下的文件内容<br>2. 使用rg搜索笔记目录下的内容，如果当前正在编辑笔记的话 |
| alt-c | 显示所有命令                                                 |
| ？    | 模糊搜索所有打开的buffer的内容                               |


#### 多光标

多光标使用的是插件[vim-visual-multi](https://github.com/mg979/vim-visual-multi)以及coc自带的多光标，如果`plug.vim`中没有[vim-visual-multi](https://github.com/mg979/vim-visual-multi)那么会使用coc自带的插件，coc行为与前者类似，但是功能不如前者多。

| 按键         | 模式              | 描述                                                         |
| ------------ | ----------------- | ------------------------------------------------------------ |
| tab          | visual-multi-mode | 在多光标模式下，使用tab可以更改光标模式                      |
| ctrl-c       | normal            | 在当前位置插入一个光标                                       |
| ctrl-down/up | normal            | 在当前位置下方/上方插入光标                                  |
| ctrl-s       | normal/visual     | 1. 选中当前光标下的所有单词<br>2. visual模式下选中所有的当前选中的内容 |
| ctrl-n       | normal            | 在visual模式下选中内容之后，按下ctrl-n会在下一处与当前选中内一样的地方插入光标。非visual模式下，与ctrl-a表现差不多，不过是依次选择当前光标下的单词。 |
| q            | visual-multi-mode | 取消当前位置插入的光标                                       |
| ]/[          | visual-multi-mode | 在多个选中的光标之间进行跳转                                 |
| n            | visual-multi-mode | 跳到下一个匹配的模式，不选中                                 |
| S            | visual-multi-mode | 在多光标模式下，将多个选中的内容进行包围                     |

#### 注释

注释插件使用[nerdcomment](https://github.com/preservim/nerdcommenter)。

| 按键             | 模式          | 描述                                       |
| ---------------- | ------------- | ------------------------------------------ |
| <leader>cs       | normal/visual | 用一种比较好看的方式注释当前行或选中的内容 |
| <leader>ci       | normal/visual | 注释/取消注释                              |
| <leader>cm       | normal/visual | 用一种最简单的方式注释当前行或选中的内容   |
| <leader>cl       | normal/visual | 按行的方式注释选中的内容                   |
| <leader>cb       | normal/visual | 注释选中的内容                             |
| <leader>cu       | normal/visual | 取消注释选中的内容                         |
| <leader>ca       | normal        | 切换到另一种注释符号                       |
|                  |               |                                            |
| <leader>cA       | normal        | 在当前行最后增加注释符号并进入插入模式     |
| <leader>c$       | normal        | 从当前光标处注释到当前行的最后             |
| <leader>c<space> |               |                                            |
| <leader>cc       |               |                                            |
| <leader>cn       |               |                                            |

#### 终端

终端使用的是[voldikss/vim-*floaterm*](https://github.com/voldikss/vim-floaterm)

| 按键  | 模式           | 描述              |
| ----- | -------------- | ----------------- |
| alt = | normal         | 打开/关闭当前终端 |
| alt + | normal/tnormal | 新建一个终端      |
| alt h | tnormal        | 切换到上一个终端  |
| alt l | tnormal        | 切换到下一个终端  |

#### 笔记

笔记使用的是插件[vimwiki/*vimwiki*](https://github.com/vimwiki/vimwiki)，可以记笔记可以写日记，支持markdown。

同时可以使用[junegunn/*fzf.vim*](https://github.com/junegunn/fzf.vim)进行笔记内容搜索。

![biji](https://s1.ax1x.com/2020/03/29/GE03VS.gif)

| 按键               | 模式    | 描述                       |
| ------------------ | ------- | -------------------------- |
| 笔记               |         |                            |
| alt s              | normal  | 搜索vimwiki中的内容        |
| <leader>ww         | normal  | 打开vimwiki                |
| <leader>wt         | normal  | 在新的tab打开vimwiki       |
| <leader>wd         | normal  | 删除当前page               |
| <leader>wr         | normal  | 重命名当前的page           |
| 日记               |         |                            |
| <leader>wi         |         | 打开日记列表               |
| <leader>w<leader>i |         | 更新当前的日记列表         |
| <leader>w<leader>w |         | 打开今天的日记             |
| <leader>w<leader>t |         | 在新的tab中打开今天的日记  |
| ctrl up/down       |         | 打开昨天/明天的日记        |
| 导航               |         |                            |
| enter              |         | 创建链接                   |
| ctrl shift enter   |         |                            |
| back               |         | 回到上一级目录             |
| tab                |         | 跳转到下一处链接           |
| shift tab          |         | 跳转到上一处链接           |
| 编辑快捷键         |         |                            |
| =                  |         | 增加标题                   |
| -                  |         | 减少标题                   |
| +                  |         | 创建链接                   |
| glm                |         | 增加list item的缩进        |
| gll                |         | 减少list item的缩进        |
| gl* 或 gl8         |         | 将该行变为*条目            |
| gl# 或 gl3         |         | 将该行变为#                |
| gl-                |         | 将该行变为-                |
| gl1                |         | 将改行变为1.               |
| 表格模式           |         |                            |
| cr                 | insert  | 插入模式                   |
| tab                | instert | 插入模式，跳到下一个输入框 |
| gqq 或 gww         | normal  | 格式化表格                 |
|                    |         |                            |

#### Git

#### 数据库

#### 绘图

绘图使用[vim-scripts/*DrawIt*](https://github.com/vim-scripts/DrawIt)，命令行输入`DrawIt`进入绘图模式。

#### Latex

#### Debug

#### Run

#### 翻译
