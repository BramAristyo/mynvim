-- Mason and lspconfig bridge.
-- Ensures specific language servers are automatically installed.
return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    require("mason-lspconfig").setup{
      ensure_installed = { "lua_ls", "gopls" },
      automatic_installation = true,
    }
  end,
}
