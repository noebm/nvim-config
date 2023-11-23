return
-- {
--   "iamcco/markdown-preview.nvim",
--   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
--   build = "cd app && yarn install",
--   init = function()
--     vim.g.mkdp_filetypes = { "markdown" }
--   end,
--   setup = function()
--     local g = vim.g
--     g.mkdp_auto_start = 1
--     g.mkdp_auto_close = 1
--     g.mkdp_page_title = "${name}.md"
--     g.mkdp_preview_options = {
--       disable_sync_scroll = 0,
--       disable_filename = 1,
--     }
--   end,
--   ft = { "markdown" },
-- }
{
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  -- keys = {
  --   { "mp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },
  -- },
  -- build = function() vim.fn["mkdp#util#install"]() end,
  -- config = function()
  --   vim.g.mkdp_auto_start = true
  --   vim.g.mkdp_browser = "firefox"
  --   vim.g.mkdp_echo_preview_url = true
  -- end,
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  -- config = function()
  --   vim.g.mkdp_auto_start = 1
  -- end,
}
