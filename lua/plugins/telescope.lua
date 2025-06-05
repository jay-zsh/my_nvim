return {
    "git@github.com:nvim-telescope/telescope.nvim.git",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "git@github.com:nvim-telescope/telescope-fzf-native.nvim.git",
            build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
                .. "cmake --build build --config Release && "
                .. "cmake --install build --prefix build",
        },
    },
    cmd

 = "Telescope",
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
    end,
}

