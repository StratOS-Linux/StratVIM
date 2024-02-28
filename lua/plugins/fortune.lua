return {
  {'rubiin/fortune.nvim', version = "*",
    config = function()
      require('fortune').setup {
        max_width = 60,
      }
    end
  }
}
