--<Ctrl-z>绑定u
vim.keymap.set({"n","i"},"<C-z>","<Cmd>undo<CR>", {silent = true})


--<jj> 绑定Esc
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

--调出终端
vim.keymap.set('n', '<C-t>', ':botright 8split | terminal<CR>', { noremap = true, silent = true })


-- 在终端模式中按 jj 切换到 normal 模式
vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { noremap = true, silent = true })

-- 在终端模式中按 Esc 切换到 normal 模式
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })

-- 模糊查找
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })


