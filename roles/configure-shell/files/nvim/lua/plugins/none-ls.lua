return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      -- Format & linting
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,
        -- Pythona
        --null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- JavaScript
        --null_ls.builtins.formatting.prettier,
        --null_ls.builtings.diagnostics.eslint_d,
      },
    })
    -- Key Bingding
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "call the format" })
  end,
}
