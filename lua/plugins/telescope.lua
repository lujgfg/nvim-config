return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'make',
            -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
            --     .. "cmake --build build --config Release && "
            --     .. "cmake --install build --prefix build",
        },
    },
    -- cmd = "Telescope",
    event = "VeryLazy",
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    },
    keys = {
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc =  'Telescope find files', mode = "n"},
        { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = 'Telescope live grep', mode = "n"},
        { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = 'Telescope recently opened files', mode = "n"},
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}

