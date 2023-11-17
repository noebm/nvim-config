
local M = {}
M._keys = {
  {"K", vim.lsp.buf.hover, desc="Hover" },
}

-- function M.get(client, buffer)
--   if not M._keys then
--     M._keys = {
--       {"K", vim.lsp.buf.hover, desc="Hover" },
--     }
--   end
--   return M._keys
-- end

function M.on_attach(client, buffer)
  for i, key in ipairs(M._keys) do
    print(i, key)
    local opts = {}
    opts.buffer = buffer
    opts.desc = key[2]
    vim.keymap.set("n", key[0], key[1], opts)
  end
end
