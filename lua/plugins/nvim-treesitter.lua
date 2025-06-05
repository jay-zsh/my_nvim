return {
    "git@github.com:nvim-treesitter/nvim-treesitter.git",
    main = "nvim-treesitter.configs",
    event = "VeryLazy",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "lua",
            "toml",
            "python",
            "java",
            "cpp",        -- C++
            "c",          -- C
            "json",
            "yaml",
            "bash",
            "markdown",
            "html",
            "css",
            "javascript",
            "typescript",
            "tsx",
            "go",
            "rust"
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
    },
}

