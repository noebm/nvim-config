return {
  -- for nvim internal documentation
  { "folke/neodev.nvim",       config = true },
  {
    "neovim/nvim-lspconfig",
    dependencies =
    {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
  },
  { "williamboman/mason.nvim", config = true },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_installation = true,
      })

      mason_lspconfig.setup_handlers({
        function(server_name)
          local opts = {}

          if server_name == "lua_ls" then
            require("neodev").setup({})
            opts.settings = {
              Lua = {
                completion = { callSnippet = "Replace" },
                workspace = { checkThirdParty = false },
                diagnostics = {
                  -- globals = 'vim',
                  disable = { 'missing-fields' }
                }
              }
            }
          end

          opts.capabilities = require("cmp_nvim_lsp").default_capabilities()
          opts.on_attach = function(client, buffer)
            require("illuminate").on_attach(client)
            -- require("config/lsp/keymaps").on_attach(client, buffer)
          end

          require("lspconfig")[server_name].setup(opts)
        end
      })
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  }
}
