--return {
--    "mason-org/mason.nvim",
--    event = "VeryLazy",
--    dependencies = {
--        "neovim/nvim-lspconfig",
--        "mason-org/mason-lspconfig.nvim"
--    },
--    opts = {
--      ui = {
--        icons = {
--            package_installed = "✓",
--            package_pending = "➜",
--            package_uninstalled = "✗"
--        }
--      }
--    },
--    config = function (_, opts)
--        require("mason").setup(opts)
--        local registry = require "mason-registry"
--
--        local function setup(name, config)
--          local ok, pkg = pcall(registry.get_package, name)
--          if  ok  and not pkg:is_installed() then
--            pkg:install()
--          end
--
--          local lsp = require("mason-lspconfig").get_mappings().package_to_lspconfig[name]
--          vim.lsp.config(lsp, config)
--        end
--
--        setup("lua-language-server", {
--          settings = {
--            Lua = {
--              diagnostics = {
--                globals = { "vim" }
--              },
--            }
--          }
--        })
--
--        setup("pyright", {})
--
--        vim.diagnostic.config({ update_in_insert = true })
--    end,
--}

return {
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig" },

    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "bashls",
        "jsonls",
        "yamlls",
        "r_language_server",
      },
      automatic_enable = true,
    },

    config = function(_, opts)
      require("mason-lspconfig").setup(opts)

      -- 自定义配置
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })

      vim.diagnostic.config({
        update_in_insert = true,
      })
    end,
  },
}




