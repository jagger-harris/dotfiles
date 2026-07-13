return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
        { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    init = function()
        -- Lazy-load neo-tree when opening a directory
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("load_neo_tree", { clear = true }),
            desc = "Load neo-tree when opening a directory",
            callback = function(args)
                local stat = vim.uv.fs_stat(args.file)
                if stat and stat.type == "directory" then
                    -- This triggers cmd-based lazy loading
                    vim.cmd("Neotree")
                    return true
                end
            end,
        })
    end,
    opts = {
        popup_border_style = "rounded",
        event_handlers = {
            {
                event = "file_open_requested",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        },
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
            },
        },
        window = {
            position = "current",
        },
    },
}
