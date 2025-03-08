vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.g.undotree_DiffCommand = "FC"
end
