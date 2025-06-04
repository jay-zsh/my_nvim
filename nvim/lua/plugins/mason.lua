return {
    "git@github.com:mason-org/mason.nvim.git",
    event = "VeryLazy",
    dependencies = {
        "git@github.com:neovim/nvim-lspconfig.git",
        "git@github.com:mason-org/mason-lspconfig.nvim.git",
        "git@github.com:mason-org/mason-registry.git",
    },
    lazy = false,
    opts = {},
    config = function(_, opts)
        local ok, mason = pcall(require, "mason")
        if not ok then
            vim.notify("Failed to load mason.nvim", vim.log.levels.ERROR)
            return
        end

        mason.setup(opts)
        local registry = require("mason-registry")
        
        local function setup_server(server, config)
            local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[server]
            if lsp then
                require("lspconfig")[lsp].setup(config)
            end
        end

        -- 异步安装和配置服务器
        local function setup_servers()
            local servers = {
                ["lua-language-server"] = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                            workspace = {
                                checkThirdParty = false,
                            },
                        }
                    }
                },
                ["pyright"] = {},
                ["html-lsp"] = {},
                ["css-lsp"] = {},
                ["typescript-language-server"] = {},
                ["emmet-ls"] = {},
                ["json-lsp"] = {},
                ["bash-language-server"] = {},
                ["clangd"] = {},
                ["rust-analyzer"] = {},
            }

            for server, config in pairs(servers) do
                local success, package = pcall(registry.get_package, server)
                
                if success then
                    if not package:is_installed() then
                        package:install():once("closed", function()
                            if package:is_installed() then
                                setup_server(server, config)
                            end
                        end)
                    else
                        setup_server(server, config)
                    end
                else
                    vim.notify("Failed to get package: " .. server, vim.log.levels.WARN)
                end
            end
        end

        -- 直接初始化注册表而不检查is_ready
        registry.refresh(function()
            vim.schedule(function()
                setup_servers()
            end)
        end)

        vim.diagnostic.config({
            virtual_text = {
                prefix = "●",
                spacing = 4,
            },
            update_in_insert = true,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
            },
        })
    end
}

