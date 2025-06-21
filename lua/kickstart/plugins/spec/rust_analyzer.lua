return {
  -- Rust con rust_analyzer
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        cargo = {
          allFeatures = true,
          loadOutDirsFromCheck = true,
          runBuildScripts = true,
        },
        procMacro = {
          enable = true,
        },
        checkOnSave = {
          command = "clippy",
        },
        inlayHints = {
          enable = true,
          showParameterHints = true,
          showTypeHints = true,
          showChainingHints = true,
        },
      },
    },
  },
} 