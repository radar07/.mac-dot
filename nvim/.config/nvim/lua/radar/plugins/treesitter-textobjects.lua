return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  config = function()
    require("nvim-treesitter-textobjects").setup({
      select = {
        lookahead = true,

        selection_modes = {
          ['@parameter.outer'] = 'v',
          ['@parameter.outer'] = 'V',
        },

        include_surrounding_whitespace = false,
      },

      move = {
        set_jumps = true,
      },
    })
    vim.keymap.set({ "x", "o" }, "af", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "if", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ac", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ic", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "aa", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ia", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@parameter.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "al", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "il", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ai", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
    end)
    vim.keymap.set({ "x", "o" }, "ii", function()
      require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
    end)

    -- keymaps
    -- You can use the capture groups defined in `textobjects.scm`
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "]F", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "]C", function()
      require("nvim-treesitter-textobjects.move").goto_next_end("@class.inner", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end)

    vim.keymap.set({ "n", "x", "o" }, "[F", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@function.inner", "textobjects")
    end)
    vim.keymap.set({ "n", "x", "o" }, "[C", function()
      require("nvim-treesitter-textobjects.move").goto_previous_end("@class.inner", "textobjects")
    end)
  end,
}

