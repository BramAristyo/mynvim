-- Nvim-lspconfig configuration.
-- Enables and configures language servers for diagnostics and completion.
return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("gopls")
    vim.lsp.enable("pyright")
    vim.lsp.enable("sqlls")
  end,
}
