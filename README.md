# Seafoam Pastel for Neovim

A soothing seafoam pastel colorscheme for Neovim, ported from MobaXterm configuration.

![Screenshot](https://via.placeholder.com/800x400/243435/d4e7d4?text=Seafoam+Pastel+Theme+Preview)

## ✨ Features

- 🎨 Soothing seafoam pastel colors
- 🖥️ True color support
- 🔧 Highly configurable
- 📚 Plugin integrations
- 🌙 Dark theme optimized
- 🚀 Fast and lightweight

## 📦 Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{
  "touchvigor/seafoam-pastel.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("seafoam-pastel").setup({
      -- your configuration here
    })
    vim.cmd("colorscheme seafoam-pastel")
  end,
}
