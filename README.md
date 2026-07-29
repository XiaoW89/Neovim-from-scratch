# Neovim Config

Personal Neovim configuration. Based on [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) by LunarVim.

Uses [packer.nvim](https://github.com/wbthomason/packer.nvim) for plugin management.

## Requirements

- Neovim >= 0.9.0
- [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) v3.0.0+
- Node.js (for LSP servers)
- Python + `pynvim` (for Python LSP support)

Quick setup:

```bash
# Python support
pip install pynvim

# Node support (optional)
npm i -g neovim

# Clipboard (Ubuntu)
sudo apt install xsel
```

## Plugins

### Plugin Manager

| Plugin | Description |
|--------|-------------|
| [packer.nvim](https://github.com/wbthomason/packer.nvim) | Plugin manager |

### Core / Library

| Plugin | Description |
|--------|-------------|
| [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) | Lua utility functions used by many plugins |
| [impatient.nvim](https://github.com/lewis6991/impatient.nvim) | Startup time optimization |
| [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) | File icons for various plugins |

### UI / Appearance

| Plugin | Description |
|--------|-------------|
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Buffer tabs line |
| [vim-bbye](https://github.com/moll/vim-bbye) | Close buffers without closing windows |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Status line |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Terminal integration |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Start screen / dashboard |
| [which-key.nvim](https://github.com/folke/which-key.nvim) | Key binding hints popup |
| [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| [symbols-outline.nvim](https://github.com/simrat39/symbols-outline.nvim) | Code symbol outline sidebar |
| [trailblazer.nvim](https://github.com/LeonHeidelbach/trailblazer.nvim) | Trail marks for cursor movement |

### Colorschemes

| Plugin | Description |
|--------|-------------|
| [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) | Tokyo Night theme |
| [darkplus.nvim](https://github.com/lunarvim/darkplus.nvim) | Dark+ theme (VS Code style) |

### Completion & Snippets

| Plugin | Description |
|--------|-------------|
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Completion engine |
| [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) | Buffer word completions |
| [cmp-path](https://github.com/hrsh7th/cmp-path) | Filesystem path completions |
| [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) | LSP completions |
| [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) | Lua API completions |
| [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) | Snippet completions |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine |
| [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) | Pre-built snippet collection |

### LSP (Language Server Protocol)

| Plugin | Description |
|--------|-------------|
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | LSP server configuration |
| [mason.nvim](https://github.com/williamboman/mason.nvim) | LSP/DAP/linter/formatter installer |
| [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) | Bridge between mason and lspconfig |
| [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) | Formatters and linters via LSP |
| [vim-illuminate](https://github.com/RRethy/vim-illuminate) | Highlight word under cursor |

### Fuzzy Finder

| Plugin | Description |
|--------|-------------|
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder (files, grep, buffers, etc.) |

### Syntax / Treesitter

| Plugin | Description |
|--------|-------------|
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code parsing |

### Git

| Plugin | Description |
|--------|-------------|
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git signs in the sign column |

### Motion

| Plugin | Description |
|--------|-------------|
| [hop.nvim](https://github.com/smoka7/hop.nvim) | Jump to any location with minimal keystrokes |
| [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Auto-close brackets, quotes, etc. |

### Editing

| Plugin | Description |
|--------|-------------|
| [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Comment/uncomment lines |
| [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) | Context-aware comment strings (JSX, Vue, etc.) |
| [neogen](https://github.com/danymat/neogen) | Annotation/comment generation |
| [project.nvim](https://github.com/ahmedkhalf/project.nvim) | Project management and switching |

### Markdown

| Plugin | Description |
|--------|-------------|
| [markview.nvim](https://github.com/OXY2DEV/markview.nvim) | Markdown preview rendering in buffer |

## Theme / Colors

### Colorscheme

Active colorscheme set in `lua/user/colorscheme.lua`:

```lua
local colorscheme = "tokyonight"
-- local colorscheme = "darkplus"
```

Available: `tokyonight`, `darkplus`. To switch, change the variable and reload Neovim.

### Lualine Theme

`lua/user/lualine.lua` — status line follows colorscheme automatically:

```lua
options = {
  theme = "auto",  -- follows active colorscheme
  -- theme = "tokyonight",  -- or set explicitly
}
```

Set `theme` to a specific colorscheme name for manual override. Lualine also ships with `auto`, `16color`, `gruvbox`, `nord`, `onedark`, `papercolor`, `solarized`, `wombat`, etc.

### Bufferline Highlights

`lua/user/bufferline.lua` — tab/buffer line colors. Custom highlight overrides under `highlights` table. Each highlight group maps `fg`/`bg` to existing `:highlight` groups (e.g., `Normal`, `TabLine`, `TabLineSel`).

```lua
highlights = {
  fill       = { fg = ... , bg = ... },
  background = { fg = ... , bg = ... },
  buffer_visible  = { ... },
  tab_selected    = { fg = ... , bg = ... },
  tab             = { ... },
  -- ... etc
}
```

To tweak, change the highlight group reference or set explicit hex colors.

### Nvim-Tree Icons

`lua/user/nvim-tree.lua` — file explorer icons. Custom Nerd Font glyphs for folders, git status, diagnostics.

```lua
renderer = {
  icons = {
    glyphs = {
      default = "",
      folder = {
        default = "",  open = "",
        empty   = "",  empty_open = "",
      },
      git = {
        unstaged = "",  staged = "S",
        untracked = "U", deleted = "",
      },
    },
  },
}
```

Requires [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts) v3.0.0+ for correct rendering.

### Toggleterm Style

`lua/user/toggleterm.lua` — terminal window appearance:

```lua
direction = "float",          -- float | horizontal | vertical
float_opts = {
  border = "curved",          -- none | single | double | shadow | curved
  winblend = 0,               -- 0 = opaque, 100 = fully transparent
  highlights = {
    border     = "Normal",
    background = "Normal",
  },
}
```

### Alpha Dashboard

`lua/user/alpha.lua` — start screen. Header ASCII art, button labels, footer. Highlight groups used:

```lua
dashboard.section.footer.opts.hl  = "Type"
dashboard.section.header.opts.hl  = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
```

Change highlight group names to match your colorscheme's groups.

### Indent Blankline

`lua/user/indentline.lua` uses `main = "ibl"` (v3+ API). Enabled with default indent character and colors inherited from colorscheme.

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   └── user/
│       ├── alpha.lua           # Start screen config
│       ├── autocommands.lua    # Autocommands
│       ├── autopairs.lua       # Auto-pairs config
│       ├── bufferline.lua      # Buffer line config
│       ├── cmp.lua             # Completion config
│       ├── colorscheme.lua     # Colorscheme config
│       ├── comment.lua         # Comment config
│       ├── gitsigns.lua        # Git signs config
│       ├── impatient.lua       # Startup optimization
│       ├── indentline.lua      # Indent guides config
│       ├── keymaps.lua         # Key mappings
│       ├── lsp/                # LSP config
│       │   ├── handlers.lua    # LSP handlers
│       │   ├── init.lua        # LSP setup
│       │   ├── mason.lua       # Mason config
│       │   ├── null-ls.lua     # Null-ls config
│       │   └── settings/       # Per-server LSP settings
│       ├── lualine.lua         # Status line config
│       ├── neogen.lua          # Annotation gen config
│       ├── nvim-tree.lua       # File explorer config
│       ├── options.lua         # Editor options
│       ├── plugins.lua         # Plugin declarations
│       ├── project.lua         # Project manager config
│       ├── symbols-outline.lua # Symbol outline config
│       ├── telescope.lua       # Telescope config
│       ├── toggleterm.lua      # Terminal config
│       ├── trailblazer.lua     # Trail marks config
│       ├── treesitter.lua      # Treesitter config
│       └── whichkey.lua        # Which-key config
```

## Key Mappings

Leader key is `<Space>`.

### Window Navigation

| Key | Action |
|-----|--------|
| `<C-h>` | Move to left window |
| `<C-j>` | Move to window below |
| `<C-k>` | Move to window above |
| `<C-l>` | Move to right window |
| `<C-Up>` | Decrease window height |
| `<C-Down>` | Increase window height |
| `<C-Left>` | Decrease window width |
| `<C-Right>` | Increase window width |

### Buffer Navigation

| Key | Action |
|-----|--------|
| `<S-h>` | Previous buffer |
| `<S-l>` | Next buffer |
| `<C-f>` | Toggle file explorer (nvim-tree) |

### Editing

| Key | Action |
|-----|--------|
| `jk` / `kj` | Exit insert mode |
| `<A-j>` | Move line down |
| `<A-k>` | Move line up |
| `>` / `<` (visual) | Indent and stay in visual mode |
| `p` (visual) | Paste without overwriting register |
| `ng` | Generate annotations (neogen) |
| `<S-s>` | Hop jump to word |

### Leader Key (`<Space>`) Mappings

Press `<Space>` and wait for which-key popup. Main groups:

| Key | Action |
|-----|--------|
| `<leader>a` | Alpha dashboard |
| `<leader>b` | List open buffers |
| `<leader>e` | Toggle file explorer |
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>c` | Close buffer |
| `<leader>h` | Clear search highlight |
| `<leader>f` | Find files (Telescope) |
| `<leader>F` | Live grep (Telescope) |
| `<leader>P` | Switch project |

#### `<leader>g` — Git

| Key | Action |
|-----|--------|
| `g g` | Lazygit toggle |
| `g j` | Next hunk |
| `g k` | Previous hunk |
| `g l` | Blame line |
| `g p` | Preview hunk |
| `g r` | Reset hunk |
| `g R` | Reset buffer |
| `g s` | Stage hunk |
| `g u` | Undo stage hunk |
| `g o` | Git status (Telescope) |
| `g b` | Checkout branch |
| `g c` | Checkout commit |
| `g d` | Diff against HEAD |

#### `<leader>l` — LSP

| Key | Action |
|-----|--------|
| `l a` | Code action |
| `l d` | Document diagnostics |
| `l w` | Workspace diagnostics |
| `l f` | Format document |
| `l i` | LSP info |
| `l I` | LSP installer info |
| `l j` | Next diagnostic |
| `l k` | Previous diagnostic |
| `l l` | CodeLens action |
| `l q` | Diagnostics to quickfix |
| `l r` | Rename symbol |
| `l s` | Document symbols |
| `l S` | Workspace symbols |

#### `<leader>p` — Packer

| Key | Action |
|-----|--------|
| `p c` | Packer compile |
| `p i` | Packer install |
| `p s` | Packer sync |
| `p S` | Packer status |
| `p u` | Packer update |

#### `<leader>s` — Search

| Key | Action |
|-----|--------|
| `s b` | Git branches |
| `s c` | Colorschemes |
| `s h` | Help tags |
| `s M` | Man pages |
| `s r` | Recent files |
| `s R` | Registers |
| `s k` | Keymaps |
| `s C` | Commands |

#### `<leader>t` — Terminal

| Key | Action |
|-----|--------|
| `t n` | Node REPL |
| `t u` | NCDU (disk usage) |
| `t t` | Htop |
| `t p` | Python REPL |
| `t f` | Float terminal |
| `t h` | Horizontal split terminal |
| `t v` | Vertical split terminal |

### Terminal Mode

| Key | Action |
|-----|--------|
| `<Esc>` | Exit terminal insert mode |
| `jk` | Exit terminal insert mode |
| `<C-h/j/k/l>` | Navigate windows |
| `<C-\>` | Toggle terminal |

### Telescope (within picker)

| Key | Action |
|-----|--------|
| `<C-n/p>` | Next/previous history |
| `<C-j/k>` | Next/previous item |
| `<CR>` | Open file |
| `<C-x>` | Horizontal split |
| `<C-v>` | Vertical split |
| `<C-t>` | Open in new tab |
| `<C-u/d>` | Scroll preview |
| `<Tab>/<S-Tab>` | Toggle selection |
| `<C-q>` | Send to quickfix |
| `?` | Show keymaps |

## ⚠️ Notes / Gotchas

- **Packer pinned commits**: `mason.nvim` and `mason-lspconfig.nvim` pinned to specific commits for stability. Update manually if needed.

- **Colorscheme**: Active theme `tokyonight`. `darkplus` available. See [Theme / Colors](#theme--colors) section for full customization.

- **LSP servers**: Mason auto-installs `pyright`, `clangd`, `jsonls`. Other servers commented out (`lua_ls`, `cssls`, `html`, `tsserver`, `bashls`, `yamlls`). Edit `lua/user/lsp/mason.lua` to enable.

- **Formatter/linter** (null-ls): Configured with `prettier`, `black`, `stylua`. Auto-format on save is commented out in `autocommands.lua`.

- **Telescope version**: Pinned to `0.1.8` tag. `master` requires Neovim 0.11+.

- **Terminal**: Lazygit, Node, Python, Htop, NCDU terminals pre-configured. Respective commands must be installed (`lazygit`, `htop`, `ncdu`).

- **Clipboard**: Linux needs `xsel` or `wl-clipboard` (Wayland). `clipboard = "unnamedplus"` set in options.

- **Leap.nvim**: Replaced by `hop.nvim`. Config files for leap still present but commented out.

- **Markdown files**: Auto `wrap` and `spell` enabled. `markview.nvim` renders markdown preview in buffer.

- **Undo**: Persistent undo enabled (`undofile = true`). Undo files stored in standard Neovim data directory.

- **Tab/indent**: `expandtab = true`, `shiftwidth = 4`, `tabstop = 4`. Spaces, not tabs.

## Health Check

```vim
:checkhealth
```

## References

- Original repo: [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch)
- [Video series](https://www.youtube.com/watch?v=ctH-a-1eUME&list=PLhoH5vyxr6Qq41NFL4GvhFp-WLd5xzIzZ)
