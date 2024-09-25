-- test.lua
return {
  { 'nvim-neotest/neotest-plenary' },
  { 'nvim-neotest/neotest-python' },
  {
    'nvim-neotest/neotest',
    -- opts = {
    --   adapters = {
    --     'neotest/plenary',
    --     ['neotest-python'] = {
    --       dap = { justMyCode = false },
    --       -- runner - 'pytest',
    --       -- args - { '-rP' },
    --     },
    --   },
    -- },
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      local test = require 'neotest'
      require('neotest').setup {
        adapters = {
          require 'neotest-python' {
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = false },
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = { '-rP' },
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            runner = 'pytest',
            -- Custom python path for the runner.
            -- Can be a string or a list of strings.
            -- Can also be a function to return dynamic value.
            -- If not provided, the path will be inferred by checking for
            -- virtual envs in the local directory and for Pipenev/Poetry configs
            -- python = ".venv/bin/python",
            -- Returns if a given file path is a test file.
            -- NB: This function is called a lot so don't perform any heavy tasks within it.
            -- is_test_file = function(file_path)
            --   ...
            -- end,
            -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
            -- instances for files containing a parametrize mark (default: false)
            -- pytest_discover_instances = true,
          },
        },
      }
      vim.keymap.set('n', '<leader>tn', test.run.run, { desc = 'Test: Run [n]earest test' })
      -- vim.keymap.set('n', '<leader>tt', test.run.run(vim.fn.expand '%'), { desc = 'Test: Run file' })
      -- vim.keymap.set('n', '<leader>td', test.run.run { strategy = 'dap' }, { desc = 'Test: [d]ebug' })
      vim.keymap.set('n', '<leader>ts', test.run.stop, { desc = 'Test: [s]top' })
      vim.keymap.set('n', '<leader>tw', test.watch.watch, { desc = 'Test: [w]atch' })
      vim.keymap.set('n', '<leader>to', test.output.open, { desc = 'Test: [o]utput' })
    end,
  },
}
