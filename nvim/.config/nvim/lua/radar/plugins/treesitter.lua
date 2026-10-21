return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'windwp/nvim-ts-autotag',
    },
    config = function()
      local treesitter = require "nvim-treesitter"
      treesitter.install {
        "astro",
        "bash",
        "c",
        "cpp",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "nix",
        "python",
        "ruby",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "yaml",
        "zig"
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufEnter' },
    enabled = true,
    opts = { mode = 'cursor', max_lines = 3 },
    config = function()
      require('treesitter-context').setup {}
    end,
  },
}
