return {
  -- Colorscheme

  -- {
  --   "rebelot/kanagawa.nvim",
  --   opts = { transparent = true, },
  -- },

  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     transparent = true,
  --     styles = {
  --       sidebars = "transparent",
  --       floats = "transparent",
  --     },
  --   },
  -- },

  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     transparent_background = true,
  --   },
  -- },

  { "ellisonleao/gruvbox.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- Dashboard
  {
    "folke/snacks.nvim",
    init = function()
      vim.api.nvim_set_hl(0, "JollyRoger", { fg = "#fee440" })
    end,

    ---@type snacks.Config
    opts = {
      dashboard = {
        ---@class snacks.dashboard.Config
        sections = {
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -r; sleep .1",
            random = 10,
            indent = 6,
            height = 30,
            pane = 2,
          },
          { section = "startup", pane = 2 },
          {
            icon = " ",
            desc = "Browse Repo",
            padding = 1,
            key = "b",
            action = function()
              Snacks.gitbrowse()
            end,
          },
          function()
            local in_git = Snacks.git.get_root() ~= nil
            local cmds = {
              {
                icon = " ",
                title = "Git Status",
                cmd = "git status --short --branch --renames --show-stash",
                height = 5,
              },
            }
            return vim.tbl_map(function(cmd)
              return vim.tbl_extend("force", {
                section = "terminal",
                enabled = in_git,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
              }, cmd)
            end, cmds)
          end,
          { section = "keys", gap = 1, padding = 1 },
        },
        styles = {},
      },
    },
  },
}
