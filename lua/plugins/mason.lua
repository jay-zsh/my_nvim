return {
    "git@github.com:mason-org/mason.nvim.git",
     event = "VeryLazy",--懒加载后加载
     dependencies = {
         "git@github.com:neovim/nvim-lspconfig.git",
         "git@github.com:mason-org/mason-lspconfig.nvim.git",
     },
     lazy = false,
     opts = {},
     config = function (_, opts)
         require("mason").setup(opts)
         local registry = require "mason-registry"
 
         local function setup(name, config)
 
         local success, package = pcall(registry.get_package, name)
             if success and not package:is_installed() then
                 package:install()
         end
 
         local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
         require("lspconfig")[lsp].setup(config)
     end
 
         local servers = {
             ["lua-language-server"] = {
                 settings = {
                     Lua = {
                     diagnostics = {
                         globals = { "vim" },
                     },
                 }
             }
         },
             pyright = {},
             ["clangd"] = {},
             ["html-lsp"] = {},
             ["css-lsp"] = {},
             ["typescript-language-server"] = {},
             ["emmet-ls"] = {},
         }
 
         for server, config in pairs(servers) do
             setup(server, config)
         end
 
 
 
         vim.cmd("LspStart") --手动启动lsp
         vim.diagnostic.config({
             virtual_text = true,
             update_in_insert = true, --插入模式显示诊断信息
         })
 
 
     end,
 }
 
 


