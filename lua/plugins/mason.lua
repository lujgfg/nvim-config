return {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mason-org/mason-lspconfig.nvim"
    },
    opts = {},
    config = function (_, opts)
        require("mason").setup(opts)
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" , "pyright" },
        })

        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({
          
        })
    end,
}
