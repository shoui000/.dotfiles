require("nightfox").setup({
  options = {
    colorblind = {
      enable = true,
      severity = {
        protan = 0.5,
        deutan = 0.2,
        tritan = 1.0
      }
    }
  }
})

vim.cmd("colorscheme carbonfox");
