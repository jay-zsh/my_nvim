#my personal nvim
 >已在basic.lua中将设置为<leader> = "<spac>"
## 插件配置关系树
---
├── README.md
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── basic.lua
│   │   ├── keymap.lua
│   │   └── lazy.lua
│   └── plugins
│       ├── blink.lua
│       ├── bufferline.lua
│       ├── grug-far.lua
│       ├── hop.lua
│       ├── indent-blankline.lua
│       ├── lspsaga.lua
│       ├── lualine.lua
│       ├── markdown.json
│       ├── mason.lua
│       ├── none-ls.lua
│       ├── nvim-autopairs.lua
│       ├── nvim-surround.lua
│       ├── nvim-tree.lua
│       ├── nvim-treesitter.lua
│       ├── telescope.lua
│       ├── test.cpp
│       ├── test.py
│       └── tokyonight.lua
└── snippets
    └── markdown.json

### 核心插件及快捷键
- 1. bufferline.nvim - 缓冲区标签管理
   
   - <leader>bh - 向左切换标签
   - <leader>bl - 向右切换标签
   - <leader>bp - 选择关闭标签
   - <leader>bc - 关闭其他标签
   - <leader>bd - 删除当前缓冲区
- 2. telescope.nvim - 模糊查找
   
   - <leader>lg - 全局内容搜索(live_grep)
- 3. nvim-tree.lua - 文件树
   
   - <leader>uf - 切换文件树
- 4. lspsaga.nvim - LSP增强
   
   - <leader>lr - 重命名符号
   - <leader>lc - 代码操作菜单
   - <leader>ld - 跳转定义
   - <leader>lh - 悬浮文档
- 5. none-ls.nvim - 代码格式化
   
   - <leader>lf - 格式化当前文件
-6. hop.nvim - 快速跳转
   
   - <leader>hp - 单词跳转
- 7. grug-far.nvim - 全局替换
   
   - <leader>fr - 查找替换
- 8. 基础快捷键 (keymap.lua)
   
   - Ctrl+z - 撤销
   - jj (插入模式) - 退出到普通模式
### 其他重要插件功能
- nvim-treesitter : 提供语法高亮和代码分析
- blink.cmp : 代码自动补全
- mason.nvim : LSP服务器管理
- lualine.nvim : 状态栏显示
