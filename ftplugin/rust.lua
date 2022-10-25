vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.rs",
  command = ":lua vim.lsp.buf.format()"
})

vim.keymap.set('n', "<space><space>", "<cmd>:lua vim.lsp.buf.format()<CR><cmd>RustReloadWorkspace<CR>",
  { silent = true })
