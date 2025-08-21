return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        -- Preconfigured snippets for different languages
        'rafamadriz/friendly-snippets',
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_lua').load({ paths = { './snippets' } })
        end,
    },
    keys = {
        { '<C-l>', function() require('luasnip').expand_or_jump() end, mode = { 'i', 's' } },
    },
    opts = {
        history = true,
        delete_check_events = 'TextChanged',
        ft_func = function()
            -- return vim.split(vim.bo.filetype, '.', { plain = true })
            if vim.bo.filetype == "lua" then
                return { "lua" }
            else
                return { }
            end
        end,
    },
    config = function(_, opts)
        require('luasnip').setup(opts)
        vim.api.nvim_create_user_command('LuaSnipEdit', function()
            require('luasnip.loaders').edit_snippet_files()
        end, {})
        end,
}
