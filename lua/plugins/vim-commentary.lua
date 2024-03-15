-- Comment/Uncomment Lines of Code
return {
  -- https://github.com/tpope/vim-commentary
  'tpope/vim-commentary',
  event = 'VeryLazy',
}

-- Normal mode:
-- gcc - Toggles the current line using linewise comment
-- gbc - Toggles the current line using blockwise comment
-- [count]gcc - Toggles the number of line given as a prefix-count using linewise
-- [count]gbc - Toggles the number of line given as a prefix-count using blockwise
-- gc[count]{motion} - (Op-pending) Toggles the region using linewise comment
-- gb[count]{motion} - (Op-pending) Toggles the region using blockwise comment
--
-- Visual mode:
-- gc - Toggles the region using linewise comment
-- gb - Toggles the region using blockwise comment
--
--
-- Example:
-- # Linewise
-- gcw - Toggle from the current cursor position to the next word
-- gc$ - Toggle from the current cursor position to the end of line
-- gc} - Toggle until the next blank line
-- gc5j - Toggle 5 lines after the current cursor position
-- gc8k - Toggle 8 lines before the current cursor position
-- gcip - Toggle inside of paragraph
-- gca} - Toggle around curly brackets
--
-- # Blockwise
--
-- gb2} - Toggle until the 2 next blank line
-- gbaf - Toggle comment around a function (w/ LSP/treesitter support)
-- gbac - Toggle comment around a class (w/ LSP/treesitter support)
--
