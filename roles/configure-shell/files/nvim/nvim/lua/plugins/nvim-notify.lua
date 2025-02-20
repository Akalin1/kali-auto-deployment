return {
  "rcarriga/nvim-notify",
  priority = 150,
  config = function()
    require("notify").setup({
      stages = 'fade_in_slide_out',
      render = 'default',
      timeout = 1000,
      background_colour = "#000000",
      max_width = 40,
      max_height = 8,
    })
    -- Use 'nvim-notify' as the default notification window
    vim.notify = require("notify")
  end
}
