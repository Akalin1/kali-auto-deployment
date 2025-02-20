return {
  -- Syntax highlighting
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",

  config = function()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      -- Automatically install missing parsers when entering buffer
      auto_install = true,
      --ensure_installed = { "lua","yaml","toml","xml","bash","html","php","java","python" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
