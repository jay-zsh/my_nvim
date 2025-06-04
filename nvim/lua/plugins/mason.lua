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
        local function setup_server(server, config)
            local mappings = require("mason-lspconfig").get_mappings()
            local lsp = mappings.package_to_lspconfig[server]
            if lsp then
                require("lspconfig")[lsp].setup(config)
            end
        end

        local function setup_servers()
            local servers = {
                ["lua-language-server"] = {
                    settings = {
                        Lua = {
                            diagnostics = { globals = { "vim" } },
                            workspace = { checkThirdParty = false },
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
                local ok, package = pcall(require("mason-registry").get_package, server)
                if not ok then
                    vim.notify("Failed to get package: " .. server, vim.log.levels.WARN)
                    goto continue
                end

                if not package:is_installed() then
                    package:install():once("closed", function()
                        if package:is_installed() then
                            setup_server(server, config)
                        end
                    end)
                else
                    setup_server(server, config)
                end
                ::continue::
            end
        end

        local ok, mason = pcall(require, "mason")
        if not ok then
            vim.notify("Failed to load mason.nvim", vim.log.levels.ERROR)
            return
        end

        mason.setup(opts)
        require("mason-registry").refresh(function()
            vim.schedule(setup_servers)
        end)

        vim.diagnostic.config({
            virtual_text = {
                prefix = " ",
                spacing = 4,
                format = function(d)
                    local icons = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " "
                    }
                    return ("%s%s (%s: %s)"):format(icons[d.severity] or "", d.message, d.source, d.code)
                end,
            },
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "always",
                format = function(d)
                    local icons = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " "
                    }
                    return ("%s\n%s: %s\n[%s]"):format(
                        icons[d.severity] .. d.message, d.source, d.code, d.severity)
                end,
            },
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "",
                    [vim.diagnostic.severity.WARN] = "",
                    [vim.diagnostic.severity.INFO] = "",
                    [vim.diagnostic.severity.HINT] = ""
                }
            },
            underline = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local bufnr = args.buf
                local clients = vim.lsp.get_clients({ bufnr = bufnr })
                print("LSP attached to buffer", bufnr, "with clients:", vim.inspect(clients))
                if #clients == 0 then return end

                local ok, bufferline = pcall(require, "bufferline")
                if ok then
                    bufferline.update_diagnostics(bufnr)
                end
            end,
        })
    end
}

