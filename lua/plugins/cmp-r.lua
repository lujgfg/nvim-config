return {
    "R-nvim/cmp-r",
    dependencies = {
        "hrsh7th/nvim-cmp"
    },
    config = function()
        local cmp = require("cmp")

        -- nvim-cmp 基本配置
        cmp.setup({
            sources = {
                { name = "cmp_r" },      -- cmp-r 对应的 source
                { name = "buffer" }, -- 可选：buffer 补全
                { name = "path" },   -- 可选：路径补全
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            }),
        })

        -- cmp-r 配置
        require("cmp_r").setup({
            filetypes = { "r", "rmd", "quarto" },
            doc_width = 58,
            quarto_intel = "/Applications/quarto/share/editor/tools/yaml/yaml-intelligence-resources.json"
        })
    end,
}
