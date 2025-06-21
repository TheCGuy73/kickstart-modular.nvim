return {
  -- JSON con jsonls
  jsonls = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
      json = {
        schemas = pcall(require, 'schemastore') and require('schemastore').json.schemas() or {},
        validate = { enable = true },
      },
    },
  },
} 