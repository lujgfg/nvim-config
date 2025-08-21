return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    branch = "master",
    event = "VeryLazy",
    opts = {
        ensure_installed = { "lua", "markdown", "markdown_inline", "r", "rnoweb", "yaml", "latex", "csv" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false, -- 一般 R/Markdown 不需要 regex 高亮
        },
    },
}
