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
  { "folke/neoconf.nvim", cmd = "Neoconf", config=true },
  -- for nvim internal documentation
  { "folke/neodev.nvim", config=true },

  { "RRethy/vim-illuminate" },
  { "windwp/nvim-autopairs", config=true },
  -- { "dcampos/cmp-snippy" },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-nvim-lsp-signature-help",
  --   },

  --   config = function()
  --     local cmp = require("cmp")
  --     -- @diagnostic disable: missing-fields
  --     cmp.setup({
  --       mapping = cmp.mapping.preset.insert({
  --         ["<Up>"] = cmp.mapping.select_prev_item(),
  --       })
  --     })
  --   end
  -- },

  -- lspconfig / mason setup
  { "williamboman/mason.nvim", config=true },
  { "neovim/nvim-lspconfig",
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
  },
  { "williamboman/mason-lspconfig.nvim",
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
                  disable = { 'missing-fields '}
                }
              }
            }
            opts.on_attach = function(client, bufnr)
              require("illuminate").on_attach(client)
            end
            -- opts.capabilities = require("cmp_nvim_lsp").default_capabilities()

            require("lspconfig")[server_name].setup(opts)
          end
        end
      })
    end
  },
  { "jose-elias-alvarez/null-ls.nvim", config=true },

{
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      -- require("your.null-ls.config") -- require your null-ls config here (example below)
      require("mason-null-ls").setup({
          ensure_installed = { "luaformatter", "jq" }
      })
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local null_ls = require("null-ls")
      local sources = {
        null_ls.builtins.formatting.stylua,
      }

      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format()
              end,
            })
          end
        end,
        sources = sources,
      })
    end,
}

}
