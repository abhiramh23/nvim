return {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        pcall(require, "file browser")
    end
}
