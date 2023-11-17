return
{
  -- colors
  { "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight"
    end
  },

  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  -- for nvim internal documentation
  { "folke/neodev.nvim", config=true },

  -- lspconfig / mason setup
  { "williamboman/mason.nvim", config=true },
  { "neovim/nvim-lspconfig",
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },

}
