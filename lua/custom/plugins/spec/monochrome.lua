return {
  {
    'kdheepak/monochrome.nvim',
    priority = 1000, -- Carica prima degli altri plugin
    config = function()
      vim.cmd.colorscheme 'monochrome'
    end,
  },
} 