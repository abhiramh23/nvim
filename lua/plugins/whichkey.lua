-- Configuration for which-key.nvim
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("whichkey")
  end,
  opts = {
    -- Your custom configuration here
    -- or leave it empty to use the default settings
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
