require 'mdeval'.setup({
  -- Don't ask before executing code blocks
  require_confirmation=false,
  -- Change code blocks evaluation options.
  eval_options = {
    -- Set custom configuration for C++
    cpp = {
      command = {"clang++", "-std=c++20", "-O0"},
      default_header = [[
    #include <iostream>
    #include <vector>
      ]]
    },
  },
})

vim.g.markdown_fenced_languages = {'python', 'cpp', 'go', 'rust'}

vim.keymap.set("n", "<leader>me", "<cmd>MdEval<CR>", { silent = true })
