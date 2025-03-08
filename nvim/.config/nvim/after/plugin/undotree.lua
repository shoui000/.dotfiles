vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

if "Windows":find(vim.loop.os_uname().sysname, 1 true) then
    vim.g.undotree_DiffCommand = "FC"
end
