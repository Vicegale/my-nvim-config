-- Fix Undefined global 'vim'
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    workspace = {
  library = { vim.env.VIMRUNTIME },
  checkThirdParty = false,
},
    filetypes = { 'lua' },
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    },
    on_attach = function(client, bufnr)
        vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true, -- Auto-triggers on typing
      convert = function(item)
        return { abbr = item.label:gsub("%b()", "") }
      end
    })
    vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { desc = "Trigger completion" })

    -- Helper function to check if there's a word before the cursor
local check_backspace = function()
  local col = vim.fn.col('.') - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

-- Map Tab to handle completion
vim.keymap.set('i', '<Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-n>' -- If menu is open, go to next item
  elseif not check_backspace() then
    return '<C-x><C-o>' -- If after a word/dot, trigger LSP completion
  else
    return '<Tab>' -- Otherwise, just insert a normal tab
  end
end, { expr = true, replace_keycodes = true })

-- Map S-Tab to go backwards in the menu
vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-p>'
  end
  return '<S-Tab>'
end, { expr = true, replace_keycodes = true })

end,
}

-- Better completion menu behavior
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }

-- Shorten the time Neovim waits to update things (improves responsiveness)
vim.opt.updatetime = 250

vim.lsp.enable('lua_ls')

