require("formatter").setup {
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = {
      --require("formatter.filetypes.lua").stylua,
    },

    c = {
      require("formatter.filetypes.c").clangformat,
    },

    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

-- Auto format after save
vim.cmd [[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
  augroup END
]]

