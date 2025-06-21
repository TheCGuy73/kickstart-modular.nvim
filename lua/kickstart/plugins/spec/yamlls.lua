return {
  -- YAML con yamlls
  yamlls = {
    capabilities = vim.lsp.protocol.make_client_capabilities(),
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
        },
      },
    },
  },
} 