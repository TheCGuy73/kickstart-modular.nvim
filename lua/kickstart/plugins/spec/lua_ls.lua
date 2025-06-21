return {
  -- Lua con lua_ls
  lua_ls = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
} 