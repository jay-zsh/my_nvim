#my personal nvim
 >已在basic.lua中将设置为<leader> = "<spac>"
## 插件配置关系树
---

c:\Users\p2046\AppData\Local\nvim
├── README.md                  # 项目说明文档
├── init.lua                   # 主入口文件
├── lazy-lock.json             # 插件版本锁定文件
├── lua\
│   ├── core\                  # 核心配置
│   │   ├── basic.lua          # 基础Vim设置
│   │   ├── keymap.lua         # 快捷键映射
│   │   └── lazy.lua           # 插件管理器配置
│   └── plugins\               # 插件配置
│       ├── blink.lua          # 自动补全插件
│       ├── bufferline.lua     # 缓冲区标签栏
│       ├── grug-far.lua       # 全局搜索替换
│       ├── hop.lua            # 快速跳转
│       ├── indent-blankline.lua # 缩进指南线
│       ├── lspsaga.lua        # LSP增强UI
│       ├── lualine.lua        # 状态栏
│       ├── mason.lua          # LSP管理器
│       ├── none-ls.lua       # 代码格式化
│       ├── nvim-autopairs.lua # 自动配对
│       ├── nvim-surround.lua  # 环绕编辑
│       ├── nvim-tree.lua      # 文件树

---


## 快捷键映射说明

### buffer切换 <bufferline.lua>
- 空格+bh 向左切换标签
- 空格+bl 向右切换标签
- 空格+bp 选择关闭标签
- 空格+bc 关闭其他标签
- 空格+bd 删除当前缓冲区

### keymap按键映射 <keymap.lua>

- Ctrl-z 映射 u 撤销ctrl z
- jj  映射 esc 
    
---

###  <lspsaga.lua>
- <leader>lf - 格式化当前文件 (LSP格式化)
- <leader>lr - 重命名符号 (Lspsaga rename)
- <leader>lc - 代码操作 (Lspsaga code_action)
- <leader>ld - 跳转到定义 (Lspsaga definition)
- <leader>lh - 查看文档 (Lspsaga hover_doc)
- <leader>lR - 查找引用 (Lspsaga finder)
- <leader>ln - 跳转到下一个诊断问题 (Lspsaga diagnostic_jump_next)
- <leader>lp - 跳转到上一个诊断问题 (Lspsaga diagnostic_jump_prev)

---
### <none-ls.lua>
- <leader>lf -lsp格式化当前文件
    
---
### <nvim-tree.lua>
- <leader>uf - 打开文件树
- jk 选择文件 enter进入
- o - 打开文件或展开目录
- a - 创建新文件
- d - 删除文件
- r - 重命名文件

---
### <Telescope.lua> 查找器
    
