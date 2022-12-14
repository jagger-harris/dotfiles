local bufferline = require("bufferline")

bufferline.setup {
  options = {
    numbers = "none",
    buffer_close_icon = "",
    close_icon = "",
    max_name_length = 30,
    max_prefix_length = 30,
    tab_size = 20,
    diagnostics = false,
    offsets = {{filetype = "NvimTree", text = "", padding = 1}},
    show_buffer_icons = true,
    show_buffer_close_icons = true,
    show_close_icon = true,
    show_tab_indicators = true,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true
  },
  highlights = {
    fill = {
      fg = {attribute = "fg", highlight = "#ff0000"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    background = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    buffer_visible = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    close_button = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    close_button_visible = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    tab_selected = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },
    tab = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    tab_close = {
      fg = {attribute = "fg", highlight = "TabLineSel"},
      bg = {attribute = "bg", highlight = "Normal"}
    },
    duplicate_selected = {
      fg = {attribute = "fg", highlight = "TabLineSel"},
      bg = {attribute = "bg", highlight = "TabLineSel"},
      italic = true
    },
    duplicate_visible = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"},
      italic = true
    },
    duplicate = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"},
      italic = true
    },
    modified = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    modified_selected = {
      fg = {attribute = "fg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },
    modified_visible = {
      fg = {attribute = "fg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    separator = {
      fg = {attribute = "bg", highlight = "TabLine"},
      bg = {attribute = "bg", highlight = "TabLine"}
    },
    separator_selected = {
      fg = {attribute = "bg", highlight = "Normal"},
      bg = {attribute = "bg", highlight = "Normal"}
    },
    indicator_selected = {
      fg = {attribute = "fg", highlight = "LspDiagnosticsDefaultHint"},
      bg = {attribute = "bg", highlight = "Normal"}
    }
  }
}
