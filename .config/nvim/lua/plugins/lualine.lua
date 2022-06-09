local lualine = require("lualine")

local diagnostics = {
    "diagnostics",
    sources = {"nvim_diagnostic"},
    sections = {"error", "warn"},
    symbols = {error = " ", warn = " "},
    colored = false,
    update_in_insert = false,
    always_visible = true
}

lualine.setup(
    {
        options = {
            disabled_filetypes = {"alpha", "dashboard", "NvimTree", "Outline"}
        },
        sections = {
            lualine_a = {"mode"},
            lualine_b = {"branch", diagnostics},
			lualine_c = {},
            lualine_x = {"encoding", "fileformat", "filetype"},
            lualine_y = {"progress"},
            lualine_z = {"location"}
        }
    }
)

