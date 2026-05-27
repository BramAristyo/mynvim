-- Mason package manager.
-- Installs and manages LSP servers, DAP servers, linters, and formatters.
return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup{}
  end,
}
