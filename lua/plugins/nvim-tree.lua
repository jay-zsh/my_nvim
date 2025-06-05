return {
    "git@github.com:nvim-tree/nvim-tree.lua.git",
    dependencies = { "git@github.com:nvim-tree/nvim-web-devicons.git" },
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
    keys = {
        { "<leader>uf", ":NvimTreeToggle<CR>" },
    },
}

