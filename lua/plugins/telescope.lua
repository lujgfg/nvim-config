return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
             build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && "
                 .. "cmake --build build --config Release && "
                 .. "cmake --install build --prefix build",
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
    keys = function()
        local builtin = require("telescope.builtin")
        return {
            { "<leader>ff", builtin.find_files, desc = "Telescope find files", mode = "n" },
            { "<leader>fg", builtin.live_grep, desc = "Telescope live grep", mode = "n" },
            { "<leader>fo", builtin.oldfiles, desc = "Telescope recently opened files", mode = "n" },
            { "<leader>fb", builtin.buffers, desc = "Telescope buffers", mode = "n" },
            { "<leader>fh", builtin.help_tags, desc = "Telescope help tags", mode = "n" },
            { "<leader>fs", builtin.git_files, desc = "Telescope git files", mode = "n" },
        }
    end,
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
    end,
}

