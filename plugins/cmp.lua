local cmp = require('cmp')
local has_luasnip, luasnip = pcall(require, 'luasnip')

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- If you configure LSPs here, re-register them with capabilities, e.g.:
-- local lspconfig = require('lspconfig')
-- lspconfig.pyright.setup({ capabilities = capabilities })
-- lspconfig.tsserver.setup({ capabilities = capabilities })

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  if col == 0 then return false end
  local prev = vim.api.nvim_buf_get_text(0, line-1, col-1, line-1, col, {})[1]
  return not prev:match('%s')
end

cmp.setup({
  snippet = {
    expand = function(args)
      if has_luasnip then luasnip.lsp_expand(args.body) end
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>']   = cmp.mapping.confirm({ select = true }),
    ['<C-e>']  = cmp.mapping.abort(),
    ['<Tab>']  = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif has_luasnip and luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif has_luasnip and luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    (has_luasnip and { name = 'luasnip' } or nil),
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

-- Optional cmdline completion:
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = 'buffer' } }
})
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({ { name = 'path' } }, { { name = 'cmdline' } })
})
