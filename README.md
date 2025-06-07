# EasyNeovim 配置说明

## 配置树概览
```
.
├── init.lua              # 主入口文件
├── lazy-lock.json        # 插件版本锁定
├── lua/
│   ├── core/             # 核心配置
│   │   ├── basic.lua     # 基础编辑器设置
│   │   ├── keymap.lua    # 全局快捷键配置  
│   │   └── lazy.lua      # 插件管理器配置
│   └── plugins/          # 插件配置
│       ├── *.lua         # 各插件独立配置
│       └── *.json        # 插件相关配置
└── snippets/             # 代码片段
    └── markdown.json     # Markdown代码片段
```

## 🚀 快速开始

1. 确保已安装Neovim 0.9+
2. 克隆本配置到`~/.config/nvim`
3. 首次启动会自动安装插件和LSP服务

## ⌨️ 完整快捷键参考

### 基础操作
| 快捷键 | 模式 | 功能 |
|--------|------|------|
| `jj` | 插入模式 | 退出到普通模式 |
| `Ctrl+z` | 普通/插入模式 | 撤销操作 |
| `Ctrl+t` | 普通模式 | 打开终端 |
| `jj`/`Esc` | 终端模式 | 退出到普通模式 |

### 文件导航
| 快捷键 | 功能 |
|--------|------|
| `<leader>uf` | 切换文件树(nvim-tree) |
| `<leader>ff` | 查找文件(Telescope) |
| `<leader>fg`/`Ctrf+f` | 全局内容搜索(Telescope) |

### 缓冲区管理
| 快捷键 | 功能 |
|--------|------|
| `<leader>bh` | 向左切换标签 |
| `<leader>bl` | 向右切换标签 |
| `<leader>bp` | 选择关闭标签 |
| `<leader>bc` | 关闭其他标签 |
| `<leader>bd` | 删除当前缓冲区 |

### LSP相关
| 快捷键 | 功能 |
|--------|------|
| `<leader>lr` | 重命名符号 |
| `<leader>lc` | 代码操作菜单 |
| `<leader>ld` | 跳转定义 |
| `<leader>lh` | 悬浮文档 |
| `<leader>lf` | 格式化当前文件 |

### 其他工具
| 快捷键 | 功能 |
|--------|------|
| `<leader>hp` | 单词跳转(hop) |
| `<leader>fr` | 查找替换(grug-far) |

## 🔌 核心插件功能

### 编辑器增强
- **nvim-treesitter**: 提供高级语法高亮和代码分析
- **blink.cmp**: 智能代码补全
- **nvim-autopairs**: 自动补全括号/引号
- **indent-blankline**: 显示缩进参考线

### LSP & 工具链
- **mason.nvim**: 管理LSP服务器、linter和格式化工具
  - 自动安装配置: Lua, Python, Java, C++, HTML/CSS等语言服务
- **lspsaga.nvim**: 增强LSP功能，提供更友好的UI
- **none-ls.nvim**: 代码格式化和静态检查

### 界面美化
- **lualine.nvim**: 自定义状态栏
- **bufferline.nvim**: 标签式缓冲区管理
- **tokyonight.lua**: 主题配色方案

### 高效导航
- **telescope.nvim**: 强大的模糊查找
  - 文件搜索、内容搜索、Git等
- **hop.nvim**: 快速跳转到可见文本
- **nvim-tree.lua**: 文件资源管理器

## ⚙️ 详细配置说明

### 核心配置 (lua/core/)
- **basic.lua**: 
  - 基础编辑器设置(行号、缩进、剪贴板等)
  - 界面显示配置(光标行、颜色列等)
  - 搜索行为设置(大小写敏感等)

- **keymap.lua**:
  - 全局快捷键定义
  - 模式特定键绑定(插入/终端模式)
  - 常用命令快捷方式

- **lazy.lua**:
  - 插件管理器(lazy.nvim)初始化
  - 自动安装插件管理器
  - 插件加载配置

### 插件配置 (lua/plugins/)
- 每个插件有独立的配置文件
- 主要配置插件功能、快捷键和集成
- 修改后需执行`:Lazy sync`更新

### 自定义建议
1. 添加新插件: 在plugins/下创建新.lua文件
2. 修改快捷键: 更新keymap.lua或插件配置文件
3. 调整LSP: 修改mason.lua中的servers表

## 🛠️ 常见问题

Q: 如何添加新的LSP服务器？
A: 在`mason.lua`的`servers`表中添加配置，例如：
```lua
["rust-analyzer"] = {}
```

Q: 如何修改主题？
A: 编辑`tokyonight.lua`或替换为其他主题插件
