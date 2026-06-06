return {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern", "lsp" },
            patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
        })

        require("telescope").load_extension("projects")

        vim.keymap.set('n', '<leader>fp', '<cmd>Telescope projects<CR>', { desc = 'Find Projects' })
    end
}
