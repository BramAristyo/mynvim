local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps") 

require("lazy").setup({
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require("ibl").setup{
        indent = {
         char = "│",
        },
        scope = {
          enabled = true,
        },
      }
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Tab>"] = cmp.mapping.confirm({ select = true }),
          ["<C-e>"] = cmp.mapping.abort(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
  
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup{}
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup{
        ensure_installed = { "lua_ls", "gopls" },
        automatic_installation = true,
      }
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("gopls")
      vim.lsp.enable("pyright")
      vim.lsp.enable("sqlls")
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup{}
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup{}

      require("nvim-treesitter").install({ "lua", "python", "javascript", "bash", "go" })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "python", "javascript", "bash", "go" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup{
        options = {
          theme = "powerline",
          section_separators = "",
          component_separators = "",
        }
      }
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup{}
    end,
  },

  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, 
    config = function()
      require("everforest").setup({})
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup{}
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup{}
    end,
  },

})
