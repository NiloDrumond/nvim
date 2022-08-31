vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = "*.ts",
  command = ":EslintFixAll"
})
