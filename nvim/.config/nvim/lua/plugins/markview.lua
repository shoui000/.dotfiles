return {
	"OXY2DEV/markview.nvim",
	lazy = false,
	ft = "markdown",
	opts = {

		preview = {
			icon_provider = "internal",
			modes = { "n", "i", "no", "c" },
			hybrid_modes = { "n", "i" },
		},

		latex = {
			enable = true,
			blocks = { 
				enable = true,
				hl = "Normal"
			},
			inline = { 
				enable = true,
				hl = "Normal"
			}
		}
	}
}
