return {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = 'InsertEnter',
    dependencies = {
        -- nvim-cmp source for neovim builtin LSP client
        'hrsh7th/cmp-nvim-lsp',
        -- nvim-cmp source for buffer words
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        -- nvim-cmp source for path
        'hrsh7th/cmp-path',
        -- Luasnip completion source for nvim-cmp
        'saadparwaiz1/cmp_luasnip',
        -- Completion using R.nvim as backend
        "R-nvim/cmp-r",
    },
    opts = function()
        local cmp = require('cmp')
        -- local defaults = require('cmp.config.default')()
        local luasnip = require('luasnip')

        local function has_words_before()
            if vim.bo.buftype == 'prompt' then
                return false
            end
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        local kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "󱢌",
            Field = "󰽐",
            Variable = "α",
            Class = "󰠱",
            Interface = "",
            Module = "󰆧",
            Property = "󰜢",
            Unit = "󰈙",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
        }


        return {
            -- sorting = defaults.sorting,
            sorting = {
                comparators = {
                    -- This function seems to work well
                    cmp.config.compare.order,
                },
            },

            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                -- { name = 'cmp_zotcite' },
                { name = 'cmp_r' },
                { name = 'otter' },
                { name = 'nvim_lsp', priority = 50 },
                { name = 'path', priority = 40 },
                { name = 'luasnip', priority = 30 },
            }),


            formatting = {
                fields = {'abbr', 'kind', 'menu'},
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
                    -- Source
                    vim_item.menu = ({
                        latex_symbols = "",
                        otter = "o",
                        nvim_lsp = '',
                        nvim_lua = 'L',
                        luasnip = '',
                        buffer = '',
                        cmdline = ":",
                        path = '',
                        cmp_zotcite = 'Z',
                        cmp_r = 'R'
                    })[entry.source.name] or entry.source.name
                    return vim_item
                end
            },

            mapping = cmp.mapping.preset.insert({
                -- <CR> accepts the currently selected item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<S-CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-n>'] = cmp.mapping.select_next_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ['<C-p>'] = cmp.mapping.select_prev_item({
                    behavior = cmp.SelectBehavior.Insert,
                }),
                ['<C-d>'] = cmp.mapping.select_next_item({ count = 5 }),
                ['<C-u>'] = cmp.mapping.select_prev_item({ count = 5 }),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-c>'] = function(fallback)
                    cmp.close()
                    fallback()
                end,
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif luasnip.locally_jumpable(1) then
                        luasnip.jump(1)
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                    elseif luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),
        }
    end,
    config = function(_, opts)
        for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
        end

        local cmp = require("cmp")
        cmp.setup(opts)

        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            -- sources = { { name = 'buffer' } }
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' },
                { name = 'cmdline' }
            })
        })

        require("cmp_r").setup({
            doc_width = 62,
        })
    end,
}
