local colorscheme = 'gruvbox'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  print('Could not find colorscheme ' .. colorscheme)
  return
end
