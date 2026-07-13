return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
        exclude = {
            filetypes = {
                "dashboard", "text"
            },
        },
        indent = {
            char = '▏',
        },
        scope = {
            show_start = false,
            show_end = false,
        },
    },
}
