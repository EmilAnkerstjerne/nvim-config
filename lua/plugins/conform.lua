return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    local function find(name)
      return vim.fs.find(name, {
        upward = true,
        stop = vim.env.HOME,
        path = vim.fn.expand("%:p:h"),
      })[1] ~= nil
    end

    local function use_biome()
      return (find("biome.json") or find("biome.jsonc"))
        and not (
          find(".prettierrc")
          or find(".prettierrc.json")
          or find(".prettierrc.js")
          or find(".prettierrc.cjs")
          or find("prettier.config.js")
          or find("prettier.config.ts")
          or find("prettier.config.cjs")
        )
    end

    local formatter = function()
      return use_biome() and { "biome" } or { "prettier" }
    end

    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.typescript = formatter
    opts.formatters_by_ft.typescriptreact = formatter
    opts.formatters_by_ft.javascript = formatter
    opts.formatters_by_ft.javascriptreact = formatter
    opts.formatters_by_ft.json = formatter

    return opts
  end,
}
