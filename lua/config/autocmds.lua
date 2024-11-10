local function show_document_symbols()
  -- Store current window ID before opening aerial
  local current_win = vim.api.nvim_get_current_win()

  require("aerial").open()

  -- Return focus to the original window
  vim.api.nvim_set_current_win(current_win)
end

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    -- Delay the symbols window slightly to ensure buffer is fully loaded
    vim.defer_fn(function()
      -- Only show for supported filetypes
      local ft = vim.bo.filetype
      local supported_ft = {
        "dart",
        "lua",
        "python",
        "javascript",
        "typescript",
        "rust",
        "go",
        "java",
        "c",
        "cpp",
        "vim",
        "markdown",
      }
      if vim.tbl_contains(supported_ft, ft) then
        show_document_symbols()
      end
    end, 100)
  end,
  group = vim.api.nvim_create_augroup("ShowDocumentSymbols", { clear = true }),
  desc = "Show document symbols on buffer load",
})

