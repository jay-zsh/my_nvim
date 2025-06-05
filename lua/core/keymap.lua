--<Ctrl-z>绑定u
vim.keymap.set({"n","i"},"<C-z>","<Cmd>undo<CR>", {silent = true})


--<jj> 绑定Esc
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = ","

