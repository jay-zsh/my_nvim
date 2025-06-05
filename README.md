my personal nvim
## 绑定快捷键
    ### bufferline.lua --buffer
        - { "<leader>bh", ":BufferLineCyclePrev<CR>", silent = true },  -- 空格+bh 向左切换标签
        - { "<leader>bl", ":BufferLineCycleNext<CR>", silent = true },  -- 空格+bl 向右切换标签
        - { "<leader>bp", ":BufferLinePickClose<CR>", silent = true },  -- 空格+bp 选择关闭标签
        - { "<leader>bc", ":BufferLineCloseOthers<CR>", silent = true }, -- 空格+bc 关闭其他标签
        - { "<leader>bd", ":bdelete<CR>", silent = true },              -- 空格+bd 删除当前缓冲区
    ### keymap.lua --按键映射
        
        - --<Ctrl-z>绑定u vim.keymap.set({"n","i"},"<C-z>","<Cmd>undo<CR>", {silent = true})
        - --<jj> 绑定Esc vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

    ### none-ls.lua --格式
        -     "<leader>lf",--空格+lf格式 vim.lsp.buf.format()
    
    ### lspsaga.lua
    { "<leader>lr", ":Lspsaga rename<CR>" },                    -- 重命名符号
    { "<leader>lc", ":Lspsaga code_action<CR>" },               -- 弹出代码操作（Code Action）菜单
    { "<leader>ld", ":Lspsaga goto_definition<CR>" },           -- 跳转到定义
    { "<leader>lh", ":Lspsaga hover_doc<CR>" },                 -- 显示悬停文档（Hover Documentation）
    { "<leader>lR", ":Lspsaga finder<CR>" },                    -- 打开引用/定义/实现的查找器
    { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>" },      -- 跳转到下一个诊断（错误/警告）
    { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>" },      -- 跳转到上一个诊断（错误/警告）


## 插件常用命令行
    ### nvim-treesitter.lua
        - InspectTree
        


    
