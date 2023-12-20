## Installation

Install the theme with your preferred package manager, such as [folke/lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
{
  "Rigellute/vcs-url.nvim",
}
```

## Usage

```vim
:VCSCopyUrl
```

Or you can map it to a key:

```vim
vim.keymap.set("n", "<leader>gv", "<cmd>lua require('plugins/Rigellute/vcs-url.nvim').copy_url()<cr>")
```
