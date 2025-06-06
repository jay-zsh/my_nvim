return {
    "mason-org/mason.nvim",
    event = "BufReadPre",  -- 改为文件读取前触发
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim",
    },
    opts = {
        ui = {
            check_outdated_packages_on_open = false,  -- 禁用打开时检查更新
        }
    },
    config = function(_, opts)
        require("mason").setup(opts)
        local registry = require("mason-registry")
        
        -- 添加延迟确保LSP完全初始化
        vim.defer_fn(function()
            local function setup(name, config)
                if not name or name == "" then
                    vim.notify("Invalid LSP server name: " .. tostring(name), vim.log.levels.ERROR)
                    return
                end

                local success, package = pcall(registry.get_package, name)
                if success and not package:is_installed() then
                    package:install()
                end

                local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
                if not lsp then
                    vim.notify("No LSP config found for: " .. name, vim.log.levels.WARN)
                    return
                end

                config.capabilities = require("blink.cmp").get_lsp_capabilities()
                config.on_attach = function(client)
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end
                require("lspconfig")[lsp].setup(config)
            end

            local servers = {
                ["lua-language-server"] = {
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                            },
                        },
                    },
                },
                pyright = {},
                ["jdtls"] = {},
                ["clangd"] = {},
                ["html-lsp"] = {},
                ["css-lsp"] = {},
                ["typescript-language-server"] = {},
                ["emmet-ls"] = {},
            }

            for server, config in pairs(servers) do
                if server and server ~= "" then
                    setup(server, config)
                end
            end
        
            -- 移除非必要的全局LSP启动命令
            vim.diagnostic.config({
                virtual_text = true,
                update_in_insert = true,
                severity_sort = true
            })
        end, 1000)  -- 1秒延迟
    end
} 

