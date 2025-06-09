return {
	"mason-org/mason.nvim",
	event = "VeryLazy", --懒加载后加载
	dependencies = {
		"neovim/nvim-lspconfig",
		"mason-org/mason-lspconfig.nvim",
	},
	opts = {},
	config = function(_, opts)
		require("mason").setup(opts)
		local registry = require("mason-registry")

local function setup(name, config)
	local success, package = pcall(registry.get_package, name)
	if success and not package:is_installed() then
		package:install()
	end

	local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
	if lsp then
		config.capabilities = require("cmp").get_lsp_capabilities() -- 修正为正确的模块名
		config.on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
		end
		require("lspconfig")[lsp].setup(config)
	end
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
			["jdtls"] = {
				cmd = { "jdtls" },
				root_dir = function(fname)
					return require("lspconfig.util").root_pattern("pom.xml", "gradle.build", ".git")(fname) 
						or vim.fn.getcwd()
				end,
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-17",
									path = "/usr/lib/jvm/java-17-openjdk",
									default = true
								}
							}
						}
					}
				}
			},
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
