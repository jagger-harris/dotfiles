return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            branch = "main",
            init = function()
                vim.g.no_plugin_maps = true
            end,
            config = function()
                set_jumps = true
            end,
            keys = {
                {
                    "]m",
                    function()
                        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
                    end,
                    desc = "goto to next start of function",
                },
                {
                    "]M",
                    function()
                        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
                    end,
                    desc = "goto to next end of function",
                },
                {
                    "[m",
                    function()
                        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
                    end,
                    desc = "goto to previous start of function",
                },
                {
                    "[:",
                    function()
                        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
                    end,
                    desc = "goto to previous end of function",
                },
            },
        },
    },
    opts = {
        ensure_installed = { "c", "cpp", "lua", "vim" },
        sync_install = false,
    },
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "*",
          callback = function(args)
            local ft = args.match
            local lang = vim.treesitter.language.get_lang(ft)
            if not lang then
              return
            end

            -- Parser must exist
            if not pcall(vim.treesitter.language.add, lang) then
              return
            end

            -- Highlighting
            if vim.treesitter.query.get(lang, "highlights") then
              pcall(vim.treesitter.start, args.buf, lang)
            end

            -- Indentation (buffer-local, safe here)
            if vim.treesitter.query.get(lang, "indents") then
              vim.bo[args.buf].indentexpr =
                "v:lua.require'nvim-treesitter'.indentexpr()"
            end

            -- Folding must wait for a window
            if vim.treesitter.query.get(lang, "folds") then
              vim.schedule(function()
                if not vim.api.nvim_buf_is_valid(args.buf) then
                  return
                end

                local win = vim.fn.bufwinid(args.buf)
                if win == -1 then
                  return
                end

                vim.api.nvim_win_set_option(win, "foldmethod", "expr")
                vim.api.nvim_win_set_option(
                  win,
                  "foldexpr",
                  "v:lua.vim.treesitter.foldexpr()"
                )

                -- Keep everything open by default
                vim.api.nvim_win_set_option(win, "foldlevel", 99)
                vim.api.nvim_win_set_option(win, "foldlevelstart", 99)
                vim.api.nvim_win_set_option(win, "foldenable", true)
              end)
            end
          end,
        })
    end,
}
