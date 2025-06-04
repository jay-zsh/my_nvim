my personal nvim
## 绑定快捷键
    ### bufferline.lua 
        - { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },  -- 空格+bh 向左切换标签
        - { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },  -- 空格+bl 向右切换标签
        - { "<leader>bp", ":BufferLinePickClose<CR>", silent = true },  -- 空格+bp 选择关闭标签
        - { "<leader>bc", ":BufferLineCloseOthers<CR>", silent = true }, -- 空格+bc 关闭其他标签
        - { "<leader>bd", ":bdelete<CR>", silent = true },              -- 空格+bd 删除当前缓冲区
    ### keymap.lua
        
        - --<Ctrl-z>绑定u vim.keymap.set({"n","i"},"<C-z>","<Cmd>undo<CR>", {silent = true})
        - --<jj> 绑定Esc vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

    ### none-ls.lua
        - keys = {
        {
            "<leader>lf",--空格+lf格式化
            function()
                vim.lsp.buf.format()
            end,
        }
    },
}
