# Neovim/LazyVim Performance Optimizations

## Changes Made

### 1. Lazy Loading Configuration
- **Changed**: `lazy = false` → `lazy = true` in `lua/config/lazy.lua`
- **Impact**: Plugins now only load when needed instead of all at startup
- **Expected improvement**: ~50-100ms faster startup

### 2. Plugin-Specific Optimizations

#### fzf-lua
- Added lazy loading on commands and keybindings
- Only loads when you use search commands
- Keybindings:
  - `<leader>ff` - Find files
  - `<leader>fg` - Live grep
  - `<leader>fb` - Buffers
  - `<leader>fh` - Help tags

#### LuaSnip
- Loads only on `InsertEnter`
- Snippet sources load lazily after first insert
- Configured with optimized settings

#### nvim-cmp
- Already optimized with `InsertEnter` event
- Popup height limited to 10 items for better performance

#### nvim-tree
- Lazy loads on command or keymap
- Keymap: `<leader>e` - Toggle file explorer

#### Telescope
- Lazy loads on command or keymap
- Common keymaps configured

#### Treesitter
- Loads on buffer read/new
- Disables for files > 100KB
- Minimal parsers installed (add more as needed)

#### Gitsigns
- Debounce increased to 200ms
- Line blame disabled for performance

### 3. LSP Optimizations for React Native

#### TypeScript Language Server (ts_ls)
- **Debounce**: Text changes debounced to 150ms (reduces CPU load)
- **Memory limit**: Set to 4096MB to prevent memory issues
- **Single file support**: Disabled (only works in projects with config)
- **Root detection**: Looks for `package.json`, `tsconfig.json`, `jsconfig.json`
- **Incremental sync**: Enabled for better performance

#### Clangd
- **Disabled autostart**: Won't interfere with JavaScript/TypeScript projects
- Only starts manually or in C/C++ projects

### 4. General Performance Settings

Added to `lua/config/options.lua`:
- `updatetime = 250` - Faster diagnostics
- `timeoutlen = 300` - Faster key sequences
- `swapfile = false` - No swap files
- `backup = false` - No backup files
- `pumheight = 10` - Limited popup menu height

## Expected Results

### Before Optimizations
- Startup time: ~314ms (with all plugins loading)
- LSP conflicts with React Native
- Heavy memory usage from TypeScript server

### After Optimizations
- Startup time: ~50-100ms (most plugins deferred)
- Clean LSP for React Native projects
- Reduced memory usage
- Faster file opening and editing

## Troubleshooting

### Issue: Plugin not loading
**Solution**: The plugin is now lazy-loaded. Check if you need to trigger it:
- Use the command (e.g., `:FzfLua`, `:NvimTreeToggle`)
- Use the keymap (e.g., `<leader>ff`, `<leader>e`)
- Enter insert mode (for cmp, luasnip)

### Issue: TypeScript LSP not working
**Solution**: 
1. Make sure you're in a directory with `package.json` or `tsconfig.json`
2. Check LSP status: `:LspInfo`
3. Restart LSP: `:LspRestart`

### Issue: Clangd interfering with JavaScript/TypeScript
**Solution**: Already fixed - clangd is disabled from autostart

### Issue: Slow performance on large files
**Solution**: Treesitter automatically disables for files > 100KB

### Issue: React Native Metro bundler conflicts
**Solution**: LSP is now configured with proper debouncing and memory limits

## Testing Your Setup

1. **Test startup time**:
   ```powershell
   nvim --startuptime startup.log +qall
   ```
   Then check the last line of `startup.log` for total time.

2. **Test LSP in React Native project**:
   ```powershell
   cd apps/MobileApplication
   nvim App.tsx
   ```
   - Check `:LspInfo` - should show only `ts_ls`
   - Try autocomplete with `<C-Space>`
   - Check diagnostics appear properly

3. **Test lazy loading**:
   - Start nvim: `nvim`
   - Check loaded plugins: `:Lazy`
   - Notice most plugins show "Not Loaded" until triggered

## Reverting Changes

If you need to revert any optimization:

1. **Revert lazy loading**: Change `lazy = true` back to `lazy = false` in `lua/config/lazy.lua`
2. **Remove specific optimizations**: Delete or comment out the plugin config in `lua/plugins/`
3. **Reload**: Run `:Lazy reload` or restart Neovim

## Additional Recommendations

1. **Keep plugins updated**: Run `:Lazy sync` periodically
2. **Monitor startup time**: Occasionally run `nvim --startuptime` to check for regressions
3. **Profile if needed**: Use `:Lazy profile` to see plugin load times
4. **Add more languages**: Update treesitter parsers in `lua/plugins/performance.lua` as needed

## React Native Specific Notes

- **ESLint**: Still runs via `eslint_d` (fast daemon)
- **Metro bundler**: Won't interfere with LSP anymore
- **TypeScript checking**: Faster with debouncing and memory limits
- **File watching**: More efficient with reduced update frequency

## Files Modified

- `lua/config/lazy.lua` - Enable lazy loading
- `lua/config/options.lua` - Performance settings
- `lua/plugins/lsp-vim.lua` - LSP optimization for React Native
- `lua/plugins/fzf.lua` - Lazy load fzf-lua
- `lua/plugins/nvim-cmp.lua` - Already optimized
- `lua/plugins/luasnip.lua` - New file for LuaSnip optimization
- `lua/plugins/performance.lua` - New file for various plugin optimizations
