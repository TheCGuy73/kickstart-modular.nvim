return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "<F1>", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      { "<F2>", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "<F3>", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "<F4>", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
}