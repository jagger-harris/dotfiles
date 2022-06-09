local project = require("project_nvim")
local telescope = require("telescope")

project.setup(
    {
        detection_methods = {"pattern"},
    }
)

telescope.load_extension("projects")

