local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", builtin.buffers, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
vim.keymap.set("n", "<leader>pt", builtin.treesitter, {})