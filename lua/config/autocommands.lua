local lsp_cmds = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_cmds,
  desc = 'LSP actions',
  callback = function(args)
    require("config/lsp/keymaps")
    local buffer = args.buf
    local client_id = args.data.client_id
    local client = vim.lsp.get_client_by_id(client_id)

    if not client.server_capabilities.documentFormattingProvider then
      return
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      -- kickstart uses one group per client
      -- see https://github.com/nvim-lua/kickstart.nvim/blob/master/lua/kickstart/plugins/autoformat.lua
      group = lsp_cmds,
      buffer = buffer,
      callback = function()
        vim.lsp.buf.format({
          async = false,
          filter = function(c)
            return c.id == client.id
          end,
        })
      end,
    })
  end
})
