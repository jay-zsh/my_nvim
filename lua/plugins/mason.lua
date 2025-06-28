return {
  "git@github.com:mason-org/mason.nvim.git",
  --event = "VeryLazy",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" }, -- 按命令触发加载
  event = { "BufReadPre", "BufNewFile" }, -- 或按文件事件延迟加载
  dependencies = {
    "git@github.com:neovim/nvim-lspconfig.git",
    "git@github.com:mason-org/mason-lspconfig.nvim.git",
    "git@github.com:mfussenegger/nvim-jdtls.git", -- 保留基础LSP支持
  },
  lazy = false,
  Copyrightts = {},
  config = function(_, opts)
    require("mason").setup(opts)
    local registry = require("mason-registry")

    local function setup(name, config)
      local success, package = pcall(registry.get_package, name)
      if success and not package:is_installed() then
        package:install()
      end

      local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
      config.capabilities = require("blink.cmp").get_lsp_capabilities()
      config.on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
      require("lspconfig")[lsp].setup(config)
    end

    -- LSP服务器列表
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
      ["clangd"] = {},
      ["html-lsp"] = {},
      ["css-lsp"] = {},
      ["typescript-language-server"] = {},
      ["emmet-ls"] = {},
      ["jdtls"] = {}, -- 通过Mason安装
    }

    for server, config in pairs(servers) do
      setup(server, config)
    end

    -- 精简版jdtls配置
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "java",
      callback = function()
        require("jdtls").start_or_attach { -- 仅启用基础LSP
          cmd = { "jdtls" },
          root_dir = require("jdtls.setup").find_root({ ".git", "pom.xml", "build.gradle" }),
          capabilities = require("blink.cmp").get_lsp_capabilities(),
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
        }
      end
    })

    vim.cmd("LspStart")
    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
    })
  end,
}
