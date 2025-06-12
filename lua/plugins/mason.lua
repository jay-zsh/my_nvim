return {
	"git@github.com:mason-org/mason.nvim.git",
	event = "VeryLazy",
	dependencies = {
		"git@github.com:neovim/nvim-lspconfig.git",
		"git@github.com:mason-org/mason-lspconfig.nvim.git",
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

		-- 完整的LSP配置列表
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
		}


		-- 遍历服务安装
		for server, config in pairs(servers) do
			setup(server, config)
		end
		-- 手动启动
		vim.cmd("LspStart")
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = true,
		})
	end,
}
