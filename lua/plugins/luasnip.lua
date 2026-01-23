return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'rafamadriz/friendly-snippets',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_lua').load({
              paths = vim.fn.stdpath("config") .. "/snippets"
            })
        end,
    },
    keys = {
        { '<C-l>', function() require('luasnip').expand_or_jump() end, mode = { 'i', 's' } },
    },
    opts = {
        history = true,
        delete_check_events = 'TextChanged',
    },
    config = function(_, opts)
        local ls = require("luasnip")
        ls.setup(opts)
        ls.filetype_extend("rmd", { "r" })
        ls.filetype_extend("qmd", { "r" })
        ls.filetype_extend("quarto", { "r" })
        vim.api.nvim_create_user_command('LuaSnipEdit', function()
            require('luasnip.loaders').edit_snippet_files()
        end, {})
        end,
}
