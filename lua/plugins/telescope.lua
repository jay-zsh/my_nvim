return {
    "git@github.com:nvim-telescope/telescope.nvim.git",
    cmd = "Telescope",  -- cmd Telescope` 懒加载
    dependencies = {
        "git@github.com:nvim-lua/plenary.nvim.git",
        {
            "git@github.com:nvim-telescope/telescope-fzf-native.nvim.git",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
                .. "cmake --build build --config Release && "
                .. "cmake --install build --prefix build",
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files (Telescope)" }, -- 按键时懒加载
        { "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep" },
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
        -- require('telescope').load_extension('fzf')
    end,
}
