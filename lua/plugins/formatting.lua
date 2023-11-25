return {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    {
      "jose-elias-alvarez/null-ls.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = true,
    },
  },
  config = function()
    local null_ls = require("null-ls")
    -- require("your.null-ls.config") -- require your null-ls config here (example below)
    require("mason-null-ls").setup({
      ensure_installed = { "jq" },
      handlers = {
        -- stylua = function(_, _)
        --   null_ls.register(null_ls.builtins.formatting.stylua)
        -- end,
      },
    })

    -- local null_ls = require("null-ls")
    -- -- local sources = {
    -- --   null_ls.builtins.formatting.stylua,
    -- -- }

    -- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    -- null_ls.setup({
    --   on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --       -- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    --       vim.api.nvim_create_autocmd("BufWritePre", {
    --         group = augroup,
    --         buffer = bufnr,
    --         callback = function()
    --           vim.lsp.buf.format()
    --         end,
    --       })
    --     end
    --   end,
    --   -- sources = sources,
    -- })
  end,
}
