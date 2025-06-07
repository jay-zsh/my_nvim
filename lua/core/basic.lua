--显示行号
vim.opt.number = true
--显示相对行号
vim.opt.relativenumber = true

--光标所在行高亮
vim.opt.cursorline = true
--单行字符数阈值高亮设置为80
vim.opt.colorcolumn = "80"

--tap转换为空格
vim.opt.expandtab = true
--tap转换为空格数量的默认值
vim.opt.tabstop = 4
--将换行缩进设置为零避免与tanstop冲突
vim.opt.shiftwidth = 0

--自动加载外部修改
vim.opt.autoread = true

--分屏默认设置为下方和右方
vim.opt.splitbelow = true
vim.opt.splitright = true

--/查找大小写敏感
vim.opt.ignorecase = true
vim.opt.smartcase = true

--查找不显示高亮
vim.opt.hlsearch = false

--关闭 Neovim 底部的模式提示信息
vim.opt.showmode = false

--将leader设置为空格
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--绑定默认寄存器和系统剪贴板
vim.opt.clipboard = "unnamedplus"

--实现类似<ctrl+a>数字自增的字母自增
vim.opt.nrformats = "bin,hex,alpha"

-- 时间间隔设置为 300ms 内必须按完两个 
vim.opt.timeoutlen = 300
