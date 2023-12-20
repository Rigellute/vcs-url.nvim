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

```lua
local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    g = {
      v = { "<cmd>VCSCopyUrl<cr>", "Copy remote URL" },
    },
  },
})
```
