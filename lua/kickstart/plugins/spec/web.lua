return {
  -- HTML con html
  html = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  },

  -- CSS con cssls
  cssls = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  },

  -- Tailwind CSS
  tailwindcss = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
  },
} 