vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.colorcolumn = "80"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0

vim.opt.autoread = true

vim.opt.showmode = false

vim.opt.list = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.clipboard = "unnamedplus" -- unnamed register + plus register

vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohlsearch<CR>')

vim.opt.nrformats = "bin,hex,alpha" --Letter auto-increment

local ime_autogroup = vim.api.nvim_create_augroup("ImeAutoGroup", { clear = true })

local is_mac = vim.loop.os_uname().sysname == "Darwin"

if is_mac then
  vim.api.nvim_create_autocmd("InsertLeave", {
      group = ime_autogroup,
      callback = function ()
          vim.system({ "macism" }, { text = true }, function(out)
              PREVIOUS_IM_CODE_MAC = string.gsub(out.stdout, "\n", "")
          end)
          vim.cmd ":silent :!macism com.apple.keylayout.ABC"
      end
  })
  vim.api.nvim_create_autocmd("InsertEnter", {
      group = ime_autogroup,
      callback = function ()
          if PREVIOUS_IM_CODE_MAC then
              vim.cmd(":silent :!macism " .. PREVIOUS_IM_CODE_MAC)
          end
          PREVIOUS_IM_CODE_MAC = nil
      end
  })
end

