vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.tsx",
  command = ":EslintFixAll"
})
