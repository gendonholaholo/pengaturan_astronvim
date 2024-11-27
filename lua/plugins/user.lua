-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {
      usercmds = true, -- Enable user commands
      log_level = "error", -- One of 'trace', 'debug', 'info', 'warn', 'error', 'off'
      timer = {
        interval = 1500, -- Interval between presence updates in milliseconds (min 500)
        reset_on_idle = false, -- Reset start timestamp on idle
        reset_on_change = false, -- Reset start timestamp on presence change
      },
      editor = {
        image = nil, -- Image ID or URL in case a custom client id is provided
        client = "neovim", -- vim, neovim, lunarvim, nvchad, astronvim or your application's client id
        tooltip = "The Superior Text Editor", -- Text to display when hovering over the editor's image
      },
      display = {
        show_time = true, -- Display start timestamp
        show_repository = true, -- Display 'View repository' button linked to repository url, if any
        show_cursor_position = false, -- Display line and column number of cursor's position
        swap_fields = false, -- If enabled, workspace is displayed first
        swap_icons = false, -- If enabled, editor is displayed on the main image
        workspace_blacklist = {}, -- List of workspace names that will hide rich presence
      },
      lsp = {
        show_problem_count = false, -- Display number of diagnostics problems
        severity = 1, -- 1 = Error, 2 = Warning, 3 = Info, 4 = Hint
        scope = "workspace", -- buffer or workspace
      },
      idle = {
        enable = true, -- Enable idle status
        show_status = true, -- Display idle status, disable to hide the rich presence on idle
        timeout = 300000, -- Timeout in milliseconds after which the idle status is set, 0 to display immediately
        disable_on_focus = false, -- Do not display idle status when neovim is focused
        text = "Idle", -- Text to display when idle
        tooltip = "💤", -- Text to display when hovering over the idle image
      },
      text = {
        viewing = "Viewing {}", -- Text to display when viewing a readonly file
        editing = "Editing {}", -- Text to display when editing a file
        file_browser = "Browsing files in {}", -- Text to display when browsing files (Empty string to disable)
        plugin_manager = "Managing plugins in {}", -- Text to display when managing plugins (Empty string to disable)
        lsp_manager = "Configuring LSP in {}", -- Text to display when managing LSP servers (Empty string to disable)
        vcs = "Committing changes in {}", -- Text to display when using Git or Git-related plugin (Empty string to disable)
        workspace = "In {}", -- Text to display when in a workspace (Empty string to disable)
      },
      buttons = {
        {
          label = "View Repository", -- Text displayed on the button
          url = "git", -- URL where the button leads to ('git' = automatically fetch Git repository URL)
        },
        -- {
        --   label = 'View Plugin',
        --   url = 'https://github.com/vyfor/cord.nvim',
        -- }
      },
      assets = nil, -- Custom file icons, see the wiki*
      -- assets = {
      --   lazy = {                                 -- Vim filetype or file name or file extension = table or string
      --     name = 'Lazy',                         -- Optional override for the icon name, redundant for language types
      --     icon = 'https://example.com/lazy.png', -- Rich Presence asset name or URL
      --     tooltip = 'lazy.nvim',                 -- Text to display when hovering over the icon
      --     type = 'plugin_manager',               -- One of 'language', 'file_browser', 'plugin_manager', 'lsp_manager', 'vcs' or respective ordinals; defaults to 'language'
      --   },
      --   ['Cargo.toml'] = 'crates',
      -- },
    }, -- calls require('cord').setup()
  },

  {
    "barrett-ruth/live-server.nvim",
    build = "pnpm add -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },

  {
    "echasnovski/mini.nvim",
    version = "*",
  },

  {
    "nvzone/volt",
    { "nvzone/timerly", cmd = "TimerlyToggle" },
  },

  {
    "tamton-aquib/mpv.nvim",
    config = true,
  },

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  {
    "scottmckendry/cyberdream.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      theme = {
        variant = "dark",
        saturation = 1,
        highlights = {
          Comment = { fg = "#00aaaa", bg = "NONE", italic = false },
          Constant = { fg = "#00ffff", bg = "NONE" },
          Identifier = { fg = "#ff00ff", bg = "NONE" },
          Function = { fg = "#00ff00", bg = "NONE" },
          Statement = { fg = "#ffffff", bg = "NONE", bold = true },
          PreProc = { fg = "#ffff00", bg = "NONE" },
          Type = { fg = "#00ff00", bg = "NONE", bold = true },
          Special = { fg = "#ff0000", bg = "NONE" },
          Delimiter = { fg = "#ffff00", bg = "NONE" },
        },
      },
    },
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "██████╗  ██████╗ ███████╗",
        "██╔════╝ ██╔═══██╗██╔════╝",
        "██║  ███╗██║   ██║███████╗",
        "██║   ██║██║   ██║╚════██║",
        "╚██████╔╝╚██████╔╝███████║",
        "╚═════╝  ╚═════╝ ╚══════╝",
        "        ███████╗██╗",
        "        ██╔════╝██║",
        "  █████╗█████╗  ██║",
        "  ╚════╝██╔══╝  ██║",
        "        ███████╗███████╗",
        "        ╚══════╝╚══════╝",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
}
