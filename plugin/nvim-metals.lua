vim.pack.add({'https://github.com/scalameta/nvim-metals.git'})
local metals = require("metals")

local config = metals.bare_config()

------------------------------------------------------------
-- blink
------------------------------------------------------------
config.capabilities =
    require("blink.cmp").get_lsp_capabilities()

------------------------------------------------------------
-- Scala
------------------------------------------------------------
config.settings = {

    showImplicitArguments = true,

    showInferredType = true,

    superMethodLensesEnabled = true,

}


------------------------------------------------------------
-- on_attach
------------------------------------------------------------
config.on_attach = function(client, bufnr)

    local map = function(lhs, rhs)

        vim.keymap.set(
            "n",
            lhs,
            rhs,
            { buffer = bufnr }
        )

    end

    map("gd", vim.lsp.buf.definition)

    map("gr", vim.lsp.buf.references)



end

------------------------------------------------------------
-- Auto Start
------------------------------------------------------------
local group =
    vim.api.nvim_create_augroup("Metals", {})

vim.api.nvim_create_autocmd(
    "FileType",
    {

        group = group,

        pattern = {
            "scala",
            "java",
            "sbt",
        },

        callback = function()

            local root =
                vim.fs.root(
                    0,
                    {
                        "build.mill",
                        "build.sc",
                        "build.sbt",
                        ".git",
                    }
                )

            if root then

                vim.notify(
                    "Starting Metals...",
                    vim.log.levels.INFO
                )

                metals.initialize_or_attach(config)

            end

        end,
    }
)
