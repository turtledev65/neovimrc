return {
  'stevearc/conform.nvim',
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      javascriptreact = { 'prettier' },
      typescriptreact = { 'prettier' },
      html = { 'prettier' },
    },
    formatters = {
      stylua = {
        prepend_args = { '--indent-type', 'Spaces', '--indent-width', 2, '--quote-style', 'AutoPreferSingle' },
      },
      prettier = {
        prepend_args = { '--config-precedence', 'prefer-file', '--arrow-parens', 'avoid', '--tab-width', 2 },
      },
    },
  },
  config = function()
    local slow_format_filetypes = {}
    require('conform').setup({
      format_on_save = function(bufnr)
        if slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        local function on_format(err)
          if err and err:match('timeout$') then
            slow_format_filetypes[vim.bo[bufnr].filetype] = true
          end
        end

        return { timeout_ms = 200, lsp_fallback = true }, on_format
      end,

      format_after_save = function(bufnr)
        if not slow_format_filetypes[vim.bo[bufnr].filetype] then
          return
        end
        return { lsp_fallback = true }
      end,
    })
  end,
}
