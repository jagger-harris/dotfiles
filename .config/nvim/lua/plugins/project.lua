local project = require("project_nvim")
local telescope = require("telescope")

project.setup(
  {
    detection_methods = {"pattern"},
    patterns = { ".git", "Makefile", "package.json" },
  }
)

telescope.load_extension("projects")
