-- plugins/telescope.lua:
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  config = function()
    require("telescope").setup {
      pickers = {
        find_files = {
          theme = 'ivy'
        }
      },
      extensions = {
        fzf = {}
      }
    }
    vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files)

    vim.keymap.set("n", "<space>fh", function()
      local opts = require('telescope.themes').get_ivy()
      require('telescope.builtin').help_tags(opts)
    end)

    vim.keymap.set("n", "<space>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath('config') }
    end)

    vim.keymap.set("n", "<space>ep", function()
      require('telescope.builtin').find_files {
        cwd = vim.fs.joinpath(vim.fn.stdpath('data'), 'lazy') }
    end)
    require('custom.telescope.multigrep').setup()
  end
}
