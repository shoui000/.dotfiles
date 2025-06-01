local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set('n', '<leader>pb', function()
  builtin.find_files({ cwd = utils.buffer_dir() });
end)

require("telescope").setup({
  defaults = {
    file_ignore_patterns = {".git/", ".cache", "%.o", "%.a", "%.out", "%.class",
		"%.pdf", "%.mkv", "%.mp4", "%.zip"}
  }
})
