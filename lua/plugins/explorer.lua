return {
  -- filesystem buffers
  -- allows editing directory like its a text file
  {
    "stevearc/oil.nvim",
    opts = {
      keymaps = {
        ["<BS>"] = "actions.parent"
      }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
  },
  -- project tree
  {
    "nvim-tree/nvim-tree.lua",
    keys = {
      { "<leader>p", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle project tree" } }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = true
  }
}
