-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  enabled = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  event = 'VimEnter',
  cmd = 'Neotree',
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
  config = function(_, opts)
    -- Apri neo-tree all'avvio se non viene specificato nessun file
    local event = 'VimEnter'
    local group = vim.api.nvim_create_augroup('Neotree_start_group', { clear = true })
    vim.api.nvim_create_autocmd(event, {
      group = group,
      pattern = '*',
      callback = function()
        -- Se non ci sono argomenti, apri neo-tree
        if vim.fn.argc() == 0 and not vim.o.diff then
          vim.cmd 'Neotree'
        -- Se c'è un argomento ed è una directory, apri neo-tree invece di netrw
        elseif vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 and not vim.o.diff then
          vim.cmd 'Neotree'
        end
      end,
    })

    require('neo-tree').setup(opts)
  end,
}
