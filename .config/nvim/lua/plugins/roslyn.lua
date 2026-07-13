return {
    "seblyng/roslyn.nvim",
    ft = { "cs" },
    opts = {
        config = {
            filetypes = { "cs" },
            root_markers = {
                "*.sln",
                "*.csproj",
                ".git",
            },
            settings = {
                ["csharp|inlay_hints"] = {
                    dotnet_show_completion_items_from_unimported_namespaces = true,
                },
            },
        },
    },
}
