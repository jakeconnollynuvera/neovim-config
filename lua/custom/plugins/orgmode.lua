return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup {
      org_agenda_files = '~/orgfiles/agenda/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
      org_capture_templates = {
        t = { description = 'Task', template = '* TODO %?\n  %u' },
        j = {
          description = 'Journal',
          template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
          target = '~/orgfiles/journal/%<%Y-%m>.org',
        },
        c = {
          description = 'Code',
          template = '\n*** %<%Y-%m-%d> %<%A>\n**** %a\n\n%?',
          target = '~/orgfiles/code_notes/%^{PROMPT}.org',
        },
      },
    }
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'org',
      callback = function()
        vim.keymap.set('i', '<S-CR>', '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
          silent = true,
          buffer = true,
        })
      end,
    })

    -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
    -- add ~org~ to ignore_install
    -- require('nvim-treesitter.configs').setup({
    --   ensure_installed = 'all',
    --   ignore_install = { 'org' },
    -- })
  end,
}
