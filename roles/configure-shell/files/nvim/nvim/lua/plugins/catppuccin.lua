return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 100, -- make sure to load this before all the other start plugins

	config = function()
		-- Catppuccin Theme
		require("catppuccin").setup({
			flavour = "mocha",
      transparent_background = true,
			color_overrides = {
				mocha = {
					--base = "#1a1b20",
          --overlay2 = "#545c7e",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin-mocha")

		--[[
    -- Get color
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    for k, v in pairs(mocha) do
      print(k, v)
    end
    --]]
	end,
}
