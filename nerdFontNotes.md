
# Neovim Setup Notes

## 1. Fonts

- **D2Coding Nerd Font Mono** (works perfectly in GNOME Terminal)
    cd ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/D2Coding.zip
    unzip D2Coding.zip
    fc-cache -fv

vim.g.have_nerd_font = true

  - Files used:
    - `D2CodingLigatureNerdFontMono-Regular.ttf`
    - `D2CodingLigatureNerdFontMono-Bold.ttf`
    - `D2CodingLigatureNerdFont-Regular.ttf`
  - Terminal settings:
    - GNOME Terminal → Preferences → Profile → Text → Custom Font
    - Font: D2CodingLigatureNerdFontMono-Regular
    - lua print(require('nvim-web-devicons').get_icon('index.js'))
  - Notes: shows DevIcons correctly, JS icon displays properly. No strange glyphs.
- **Other fonts downloaded** (optional list for reference)
  - FiraCode, Cascadia, etc.

---

## 2. Plugin Load Order Notes

- `nvim-web-devicons` must load **first**
  - Lazy.nvim config: `lazy = false`, `priority = 1000`
- Plugins that rely on it:
  - `bufferline.nvim`
  - `telescope.nvim`
  - `mini.nvim` (icons in statusline / UI)
  
---

## 3. Lazy.nvim Notes

- Lazy UI symbols (chevrons, lightning, etc.) are now visible
- Tested with:
  - `:Lazy`
  - `:Lazy log`

---

## 4. Terminal / Neovim Notes

- GNOME Terminal + Bash works with Nerd Font
- Escape behavior in terminal buffer is default
- Nerd Font icons require `vim.g.have_nerd_font = true`
