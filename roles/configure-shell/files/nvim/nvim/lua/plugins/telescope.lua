return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<C-f>", builtin.find_files, { desc = "Ctrl+f open Telescope to find files" })
      vim.keymap.set("n", "<C-g>", builtin.live_grep, { desc = "Ctrl+g open Telescope live grep" })
    end,
  },
  {
    -- For set telescope to the selection interface API (vim.ui.select) , include vim.lsp.buf.code_action()
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
