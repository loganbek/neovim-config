--
-- Copyright (c) 2022 luaneko <luaneko@chiya.dev>
--
-- Use of this source code is governed by the MIT License
-- which can be found in the LICENSE file and at:
--
--   https://chiya.dev/licenses/mit.txt
--
return {
  -- modern fzf alternative
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "kyazdani42/nvim-web-devicons",
    },
    function()
      require("telescope").setup {
        defaults = require("telescope.themes").get_ivy {
          file_ignore_patterns = (function()
            local ignore_dirs = {}

            for _, name in ipairs {
              "node_modules",
              "target",
              "in",
              "out",
              "build",
            } do
              table.insert(ignore_dirs, string.format("^%s/", name))
              table.insert(ignore_dirs, string.format("/%s/", name))
            end

            return ignore_dirs
          end)(),
        },

        pickers = {
          buffers = {
            sort_lastused = true,
            mappings = {
              n = {
                ["<backspace>"] = require("telescope.actions").delete_buffer,
              },
            },
          },
        },
      }
    end,
  },

  -- quick buffer navigation
  {
    "ggandor/leap.nvim",
    requires = "tpope/vim-repeat",
    function()
      require("leap").add_default_mappings()
      vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" })
    end,
  },

  -- peek lines without jumping
  {
    "nacro90/numb.nvim",
    function()
      require("numb").setup()
    end,
  },
}
