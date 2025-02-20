return {
  {
    -- For installing and managing language servers
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- Ensure that Mason installs the LSPs we need
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Ensure automatically installing any Language Server that don’t exist on system
        ensure_installed = {
          -- Add your desired language servers here
          "lua_ls",
          "pyright",
          "bashls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    -- Configure & connect language server, bind keys
    "neovim/nvim-lspconfig",
    config = function()
      -- Advertise cmp_nvim_lsp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")
      -- Enable the language server
      lspconfig.lua_ls.setup({
        -- Gets attached to a buffer
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.bashls.setup({
        capabilities = capabilities,
      })

      -- Key Binding
      vim.keymap.set(
        "n",
        "<leader>h",
        vim.lsp.buf.hover,
        { desc = "Show document/description info at the cursor position" }
      )
      vim.keymap.set(
        "n",
        "<leader>j",
        vim.lsp.buf.definition,
        { desc = "Jump to the definition of the identifier where the cursor is located" }
      )
      vim.keymap.set(
        "n",
        "<leader>c",
        vim.lsp.buf.code_action,
        { desc = "Show code_actions menu at the current context" }
      )
    end,
  },
}
