-- Nvim-lspconfig configuration.
-- Enables and configures language servers for diagnostics and completion.
return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})
		vim.lsp.config["lua_ls"] = {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim" } },
					workspace = {
						checkThirdParty = false,
						library = vim.api.nvim_get_runtime_file("", true),
					},
					telemetry = { enable = false },
				},
			},
		}

		vim.lsp.config["intelephense"] = {
			filetypes = { "php", "blade" },
			settings = {
				intelephense = {
					files = {
						maxSize = 5000000,
					},
				},
			},
		}

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("sqlls")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("intelephense")
		vim.lsp.enable("bufls")
	end,
}
