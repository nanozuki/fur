-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/crows/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/crows/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/crows/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/crows/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/crows/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ale = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/ale"
  },
  ["auto-session"] = {
    config = { "\27LJ\2\n’\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\6~\18pre_save_cmds\1\0\0\1\2\0\0\18NvimTreeClose\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["ctrlsf.vim"] = {
    config = { "\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\arg\18ctrlsf_ackprg\6g\bvim\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/ctrlsf.vim"
  },
  edge = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/edge"
  },
  ["emmet-vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["feline.nvim"] = {
    config = { "\27LJ\2\nò\1\0\0\4\0\t\0\0225\0\0\0006\1\1\0009\1\2\1)\3\19\0B\1\2\2'\2\3\0<\2\1\0006\1\1\0009\1\2\1)\3\22\0B\1\2\2'\2\4\0<\2\1\0'\1\5\0006\2\6\0009\2\a\0029\2\b\2B\2\1\0028\2\2\0'\3\5\0&\1\3\1L\1\2\0\tmode\afn\bvim\6 \fS-BLOCK\fV-BLOCK\tchar\vstring\1\0\v\6c\fCOMMAND\6v\vVISUAL\6i\vINSERT\6S\vS-LINE\6r\vPROMPT\6R\fREPLACE\6t\rTERMINAL\6!\nSHELL\6V\vV-LINE\6n\vNORMAL\6s\vSELECTT\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\3\18\2\0\0'\3\3\0J\2\3\0\tïž¡ \15git_branch\25feline.providers.git\frequireR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2d\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvim¼\1\0\2\v\0\v\1\0264\2\0\0006\3\0\0006\5\1\0009\5\2\0059\5\3\0056\a\1\0009\a\4\a9\a\5\a\18\t\1\0B\a\2\0A\5\0\0A\3\0\4H\6\6€\21\b\2\0\22\b\0\b'\t\6\0009\n\a\a&\t\n\t<\t\b\2F\6\3\3R\6ø6\3\b\0009\3\t\3\18\5\2\0'\6\n\0D\3\3\0\6 \vconcat\ntable\tname\tï‚… \21nvim_win_get_buf\bapi\20buf_get_clients\blsp\bvim\npairs\2^\0\2\a\0\6\0\f'\2\0\0006\3\1\0009\3\2\0036\4\1\0009\4\3\0049\4\4\4\18\6\1\0B\4\2\0028\3\4\0039\3\5\3&\2\3\2L\2\2\0\rfiletype\21nvim_win_get_buf\bapi\abo\bvim\6 Ë\2\0\2\f\0\r\00126\2\0\0006\4\1\0009\4\2\0049\4\3\4\18\6\1\0B\4\2\0A\2\0\0036\4\1\0009\4\2\0049\4\4\0046\6\1\0009\6\2\0069\6\5\6\18\b\1\0B\6\2\0A\4\0\2+\5\0\0\t\2\0\0X\6\b€6\6\6\0009\6\a\6'\b\b\0\18\t\4\0\18\n\3\0B\6\4\2\18\5\6\0X\6\18€\5\2\4\0X\6\b€6\6\6\0009\6\a\6'\b\t\0\18\t\4\0\18\n\3\0B\6\4\2\18\5\6\0X\6\b€6\6\6\0009\6\a\6'\b\n\0\18\t\2\0\18\n\4\0\18\v\3\0B\6\5\2\18\5\6\0\18\6\5\0'\a\v\0&\6\a\6'\a\f\0J\6\3\0\n ïš£ \6 \r%d/%d:%d\14BOT/%d:%d\14TOP/%d:%d\vformat\vstring\21nvim_win_get_buf\24nvim_buf_line_count\24nvim_win_get_cursor\bapi\bvim\vunpack\2š\1\0\2\6\0\n\0\0256\2\0\0009\2\1\0029\2\2\2\18\4\1\0B\2\2\0026\3\0\0009\3\3\0038\3\2\0039\3\4\3\6\3\5\0X\3\6€6\3\0\0009\3\3\0038\3\2\0039\3\4\3\14\0\3\0X\4\3€6\3\0\0009\3\6\0039\3\a\3\18\4\3\0'\5\b\0&\4\5\4'\5\t\0J\4\3\0\tïŸ¼ \6 \benc\6o\5\tfenc\abo\21nvim_win_get_buf\bapi\bvim¯\v\1\0\v\0H\0ˆ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\6\0B\2\2\0014\2\t\0005\3\b\0003\4\a\0=\4\t\0035\4\n\0=\4\v\3>\3\1\0025\3\f\0005\4\r\0=\4\v\3>\3\2\0025\3\17\0005\4\14\0005\5\15\0=\5\16\4=\4\t\0035\4\18\0=\4\v\3>\3\3\0025\3\19\0005\4\20\0=\4\v\3>\3\4\0025\3\22\0003\4\21\0=\4\t\0035\4\23\0=\4\v\0033\4\24\0=\4\25\3>\3\5\0025\3\26\0005\4\27\0=\4\v\0033\4\28\0=\4\25\3>\3\6\0025\3\29\0005\4\30\0=\4\v\0033\4\31\0=\4\25\3>\3\a\0025\3 \0005\4!\0=\4\v\0033\4\"\0=\4\25\3>\3\b\0024\3\a\0005\4$\0003\5#\0=\5\t\0045\5%\0=\5\v\4>\4\1\0035\4&\0005\5'\0=\5\v\4>\4\2\0035\4)\0003\5(\0=\5\t\0045\5*\0=\5\v\4>\4\3\0035\4+\0005\5,\0=\5\v\4>\4\4\0035\4.\0003\5-\0=\5\t\0045\5/\0=\5\v\4>\4\5\0035\0041\0003\0050\0=\5\t\0045\0052\0=\5\v\4>\4\6\0034\4\3\0005\0053\0005\0064\0=\6\v\5>\5\1\0045\0057\0005\0065\0005\a6\0=\a\16\6=\6\t\0055\0068\0=\6\v\5>\5\2\0044\5\3\0005\0069\0005\a:\0=\a\v\6>\6\1\0059\6\5\0015\b;\0=\0<\b5\t=\0004\n\3\0>\2\1\n>\3\2\n=\n>\t4\n\3\0>\4\1\n>\5\2\n=\n?\t=\t@\b5\tB\0005\nA\0=\nC\t5\nD\0=\nE\t4\n\0\0=\nF\t=\tG\bB\6\2\1K\0\1\0\19force_inactive\rbufnames\rbuftypes\1\2\0\0\rterminal\14filetypes\1\0\0\1\3\0\0\rNvimTree\thelp\15components\rinactive\vactive\1\0\0\vcolors\1\0\0\1\0\2\afg\15accent_sec\abg\abg\1\0\1\rprovider\t â–ˆ\1\0\2\afg\afg\abg\abg\1\0\0\1\0\3\ttype\rrelative\23file_readonly_icon\tï€£ \17colored_icon\1\1\0\1\tname\14file_info\1\0\2\afg\vaccent\abg\abg\1\0\1\rprovider\tâ–ˆ \1\0\2\afg\abg\abg\15accent_sec\1\0\0\0\1\0\2\afg\abg\abg\15accent_sec\1\0\1\rleft_sep\5\0\1\0\2\afg\15accent_sec\abg\vbg_sec\1\0\1\rprovider\t î‚º\1\0\2\afg\afg\abg\vbg_sec\1\0\0\0\1\0\1\afg\vbg_sec\1\0\1\rprovider\t î‚º\1\0\1\afg\vfg_sec\1\0\0\0\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\21git_diff_changed\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\21git_diff_removed\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\19git_diff_added\fenabled\0\1\0\1\afg\vfg_sec\1\0\0\0\1\0\1\afg\vbg_sec\1\0\1\rprovider\tî‚¼ \1\0\2\afg\afg\abg\vbg_sec\1\0\0\topts\1\0\3\ttype\rrelative\23file_readonly_icon\tï€£ \17colored_icon\1\1\0\1\tname\14file_info\1\0\2\afg\vaccent\abg\vbg_sec\1\0\1\rprovider\tî‚¼ \ahl\1\0\3\abg\vaccent\afg\abg\nstyle\tbold\rprovider\1\0\0\0\1\0\1\15signcolumn\1\nsetup\rgitsigns\vfeline\fpalette\23features.ui.colors\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["fur.nvim"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/fur.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["go.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ago\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/go.nvim"
  },
  ["gruvbox-material"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n–\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\a\0\0\thelp\vnofile\fnowrite\rquickfix\rterminal\vprompt\1\0\1\tchar\aÂ¦\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\np\0\2\6\0\6\0\t6\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireB\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\flib.lsp\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["nord.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/nord.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisible-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand\5\1\0\f\0&\0C6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0003\3\6\0009\4\a\0005\6\t\0005\a\b\0=\a\n\0065\a\v\0=\a\f\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0064\a\0\0=\a\17\0065\a\20\0009\b\18\0009\b\19\bB\b\1\2=\b\21\a9\b\18\0009\b\22\bB\b\1\2=\b\23\a9\b\18\0009\b\24\bB\b\1\2=\b\25\a9\b\18\0009\b\26\b5\n\27\0B\b\2\2=\b\28\a9\b\18\0\18\n\2\0005\v\29\0B\b\3\2=\b\30\a9\b\18\0\18\n\3\0005\v\31\0B\b\3\2=\b \a=\a\18\0064\a\5\0005\b!\0>\b\1\a5\b\"\0>\b\2\a5\b#\0>\b\3\a5\b$\0>\b\4\a=\a%\6B\4\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\18documentation\fsnippet\vexpand\1\0\0\0\fsorting\1\0\1\20priority_weight\3\1\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noinsert\nsetup\0\0\tload luasnip.loaders.from_vscode\fluasnip\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lsputils"] = {
    config = { "\27LJ\2\n¾\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\nÀ\1\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0005\3\t\0=\3\n\2B\0\2\1K\0\1\0\16diagnostics\1\0\1\venable\2\1\0\2\15update_cwd\2\18disable_netrw\1\nsetup\14nvim-tree\tauto\15signcolumn\fwinopts\tView\19nvim-tree.view\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n…\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\4\0\5\0\n5\0\0\0004\1\0\0=\1\1\0006\1\2\0'\3\3\0B\1\2\0029\1\4\1\18\3\0\0B\1\2\1K\0\1\0\nsetup\15rust-tools\frequire\ntools\1\0\0\0" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
  },
  ["session-lens"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["tabby.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\5\0\6\0\r'\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\2\0039\3\4\3B\3\1\2'\4\5\0B\1\3\2'\2\0\0&\0\2\0L\0\2\0\a:t\vgetcwd\16fnamemodify\afn\bvim\6 ;\0\1\4\0\3\0\0056\1\0\0009\1\1\0019\1\2\1\18\3\0\0D\1\2\0\28nvim_tabpage_get_number\bapi\bvim|\0\1\6\2\b\0\0175\1\6\0'\2\0\0-\3\0\0\18\5\0\0B\3\2\2'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\1\0009\3\2\3=\3\4\2-\3\1\0009\3\5\3=\3\2\2=\2\a\1L\1\2\0\3À\0À\ahl\1\0\0\15accent_sec\afg\1\0\1\nstyle\tbold\abg\6 \n ïƒˆ x\0\1\6\2\b\0\0175\1\6\0'\2\0\0-\3\0\0\18\5\0\0B\3\2\2'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\1\0009\3\2\3=\3\2\2-\3\1\0009\3\4\3=\3\5\2=\2\a\1L\1\2\0\3À\0À\ahl\1\0\0\abg\vbg_sec\1\0\1\nstyle\tbold\afg\6 \n ï‚– x\0\1\6\2\t\0\0185\1\a\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\6\2=\2\b\1L\1\2\0\1À\0À\ahl\1\0\0\abg\vbg_sec\1\0\0\afg\6 \vunique\n ï†’ x\0\1\6\2\t\0\0185\1\a\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\6\2=\2\b\1L\1\2\0\1À\0À\ahl\1\0\0\abg\vbg_sec\1\0\0\afg\6 \vunique\n ï„Œ ¦\a\1\0\t\0;\0Ž\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0023\2\4\0003\3\5\0005\4\t\0005\5\a\0009\6\6\0=\6\6\0059\6\b\0=\6\b\5=\5\n\0044\5\3\0005\6\r\0>\2\1\0065\a\v\0009\b\b\0=\b\6\a9\b\f\0=\b\b\a=\a\n\6>\6\1\0055\6\14\0005\a\15\0009\b\f\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6>\6\2\5=\5\16\0045\5\18\0003\6\17\0=\6\19\0055\6\20\0005\a\22\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6\24\0005\a\25\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5\27\0045\5\29\0003\6\28\0=\6\19\0055\6\30\0005\a \0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6!\0005\a\"\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5#\0045\5%\0003\6$\0=\6\19\0055\6&\0005\a'\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6(\0005\a)\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5*\0045\5,\0003\6+\0=\6\19\0055\6-\0005\a.\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6/\0005\a0\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\0051\0044\5\3\0005\0062\0005\a3\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6>\6\1\0055\0064\0005\a5\0009\b\b\0=\b\6\a9\b\21\0=\b\b\a=\a\n\6>\6\2\5=\0056\0046\5\0\0'\a7\0B\5\2\0029\0058\0055\a9\0=\4:\aB\5\2\0012\0\0€K\0\1\0\ftabline\1\0\0\nsetup\ntabby\ttail\1\0\0\1\2\0\0\n ïƒ¶ \1\0\0\1\2\0\0\bî‚º\bwin\1\0\0\1\2\0\0\bî‚¼\1\0\0\1\2\0\0\bî‚º\1\0\0\0\ftop_win\1\0\0\1\2\0\0\bî‚¼\1\0\0\1\2\0\0\bî‚º\1\0\0\0\17inactive_tab\1\0\0\1\2\0\0\bî‚¼\1\0\0\vbg_sec\1\2\0\0\bî‚º\1\0\0\0\15active_tab\14right_sep\1\0\0\1\2\0\0\bî‚¼\rleft_sep\1\0\0\15accent_sec\1\2\0\0\bî‚º\nlabel\1\0\0\0\thead\1\0\0\1\2\0\0\bî‚¼\1\0\0\vaccent\1\0\0\ahl\1\0\1\vlayout\24active_wins_at_tail\abg\1\0\0\afg\0\0\19tabby.filename\fpalette\23features.ui.colors\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/tabby.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-z.nvim"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/telescope-z.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n”\2\0\0\5\0\v\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\5\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0005\2\t\0005\3\b\0005\4\a\0=\4\4\3=\3\n\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\nsetup\17session-lens\bfzf\6z\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-fish"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/opt/vim-fish"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/vim-sleuth"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/crows/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\np\0\2\6\0\6\0\t6\2\0\0'\4\1\0B\2\2\0029\2\2\0025\4\3\0005\5\4\0=\5\5\4B\2\2\1K\0\1\0\17handler_opts\1\0\1\vborder\tnone\1\0\1\tbind\2\14on_attach\18lsp_signature\frequireB\1\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0003\2\3\0B\0\2\1K\0\1\0\0\18add_on_attach\flib.lsp\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
try_loadstring("\27LJ\2\nò\1\0\0\4\0\t\0\0225\0\0\0006\1\1\0009\1\2\1)\3\19\0B\1\2\2'\2\3\0<\2\1\0006\1\1\0009\1\2\1)\3\22\0B\1\2\2'\2\4\0<\2\1\0'\1\5\0006\2\6\0009\2\a\0029\2\b\2B\2\1\0028\2\2\0'\3\5\0&\1\3\1L\1\2\0\tmode\afn\bvim\6 \fS-BLOCK\fV-BLOCK\tchar\vstring\1\0\v\6c\fCOMMAND\6v\vVISUAL\6i\vINSERT\6S\vS-LINE\6r\vPROMPT\6R\fREPLACE\6t\rTERMINAL\6!\nSHELL\6V\vV-LINE\6n\vNORMAL\6s\vSELECTT\0\0\4\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\3\18\2\0\0'\3\3\0J\2\3\0\tïž¡ \15git_branch\25feline.providers.git\frequireR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2d\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvimR\0\1\4\0\3\0\f6\1\0\0009\1\1\0019\1\2\1\18\3\0\0B\1\2\2)\2x\0\0\2\1\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\23nvim_win_get_width\bapi\bvim¼\1\0\2\v\0\v\1\0264\2\0\0006\3\0\0006\5\1\0009\5\2\0059\5\3\0056\a\1\0009\a\4\a9\a\5\a\18\t\1\0B\a\2\0A\5\0\0A\3\0\4H\6\6€\21\b\2\0\22\b\0\b'\t\6\0009\n\a\a&\t\n\t<\t\b\2F\6\3\3R\6ø6\3\b\0009\3\t\3\18\5\2\0'\6\n\0D\3\3\0\6 \vconcat\ntable\tname\tï‚… \21nvim_win_get_buf\bapi\20buf_get_clients\blsp\bvim\npairs\2^\0\2\a\0\6\0\f'\2\0\0006\3\1\0009\3\2\0036\4\1\0009\4\3\0049\4\4\4\18\6\1\0B\4\2\0028\3\4\0039\3\5\3&\2\3\2L\2\2\0\rfiletype\21nvim_win_get_buf\bapi\abo\bvim\6 Ë\2\0\2\f\0\r\00126\2\0\0006\4\1\0009\4\2\0049\4\3\4\18\6\1\0B\4\2\0A\2\0\0036\4\1\0009\4\2\0049\4\4\0046\6\1\0009\6\2\0069\6\5\6\18\b\1\0B\6\2\0A\4\0\2+\5\0\0\t\2\0\0X\6\b€6\6\6\0009\6\a\6'\b\b\0\18\t\4\0\18\n\3\0B\6\4\2\18\5\6\0X\6\18€\5\2\4\0X\6\b€6\6\6\0009\6\a\6'\b\t\0\18\t\4\0\18\n\3\0B\6\4\2\18\5\6\0X\6\b€6\6\6\0009\6\a\6'\b\n\0\18\t\2\0\18\n\4\0\18\v\3\0B\6\5\2\18\5\6\0\18\6\5\0'\a\v\0&\6\a\6'\a\f\0J\6\3\0\n ïš£ \6 \r%d/%d:%d\14BOT/%d:%d\14TOP/%d:%d\vformat\vstring\21nvim_win_get_buf\24nvim_buf_line_count\24nvim_win_get_cursor\bapi\bvim\vunpack\2š\1\0\2\6\0\n\0\0256\2\0\0009\2\1\0029\2\2\2\18\4\1\0B\2\2\0026\3\0\0009\3\3\0038\3\2\0039\3\4\3\6\3\5\0X\3\6€6\3\0\0009\3\3\0038\3\2\0039\3\4\3\14\0\3\0X\4\3€6\3\0\0009\3\6\0039\3\a\3\18\4\3\0'\5\b\0&\4\5\4'\5\t\0J\4\3\0\tïŸ¼ \6 \benc\6o\5\tfenc\abo\21nvim_win_get_buf\bapi\bvim¯\v\1\0\v\0H\0ˆ\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0026\2\0\0'\4\4\0B\2\2\0029\2\5\0025\4\6\0B\2\2\0014\2\t\0005\3\b\0003\4\a\0=\4\t\0035\4\n\0=\4\v\3>\3\1\0025\3\f\0005\4\r\0=\4\v\3>\3\2\0025\3\17\0005\4\14\0005\5\15\0=\5\16\4=\4\t\0035\4\18\0=\4\v\3>\3\3\0025\3\19\0005\4\20\0=\4\v\3>\3\4\0025\3\22\0003\4\21\0=\4\t\0035\4\23\0=\4\v\0033\4\24\0=\4\25\3>\3\5\0025\3\26\0005\4\27\0=\4\v\0033\4\28\0=\4\25\3>\3\6\0025\3\29\0005\4\30\0=\4\v\0033\4\31\0=\4\25\3>\3\a\0025\3 \0005\4!\0=\4\v\0033\4\"\0=\4\25\3>\3\b\0024\3\a\0005\4$\0003\5#\0=\5\t\0045\5%\0=\5\v\4>\4\1\0035\4&\0005\5'\0=\5\v\4>\4\2\0035\4)\0003\5(\0=\5\t\0045\5*\0=\5\v\4>\4\3\0035\4+\0005\5,\0=\5\v\4>\4\4\0035\4.\0003\5-\0=\5\t\0045\5/\0=\5\v\4>\4\5\0035\0041\0003\0050\0=\5\t\0045\0052\0=\5\v\4>\4\6\0034\4\3\0005\0053\0005\0064\0=\6\v\5>\5\1\0045\0057\0005\0065\0005\a6\0=\a\16\6=\6\t\0055\0068\0=\6\v\5>\5\2\0044\5\3\0005\0069\0005\a:\0=\a\v\6>\6\1\0059\6\5\0015\b;\0=\0<\b5\t=\0004\n\3\0>\2\1\n>\3\2\n=\n>\t4\n\3\0>\4\1\n>\5\2\n=\n?\t=\t@\b5\tB\0005\nA\0=\nC\t5\nD\0=\nE\t4\n\0\0=\nF\t=\tG\bB\6\2\1K\0\1\0\19force_inactive\rbufnames\rbuftypes\1\2\0\0\rterminal\14filetypes\1\0\0\1\3\0\0\rNvimTree\thelp\15components\rinactive\vactive\1\0\0\vcolors\1\0\0\1\0\2\afg\15accent_sec\abg\abg\1\0\1\rprovider\t â–ˆ\1\0\2\afg\afg\abg\abg\1\0\0\1\0\3\ttype\rrelative\23file_readonly_icon\tï€£ \17colored_icon\1\1\0\1\tname\14file_info\1\0\2\afg\vaccent\abg\abg\1\0\1\rprovider\tâ–ˆ \1\0\2\afg\abg\abg\15accent_sec\1\0\0\0\1\0\2\afg\abg\abg\15accent_sec\1\0\1\rleft_sep\5\0\1\0\2\afg\15accent_sec\abg\vbg_sec\1\0\1\rprovider\t î‚º\1\0\2\afg\afg\abg\vbg_sec\1\0\0\0\1\0\1\afg\vbg_sec\1\0\1\rprovider\t î‚º\1\0\1\afg\vfg_sec\1\0\0\0\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\21git_diff_changed\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\21git_diff_removed\0\1\0\1\afg\vfg_sec\1\0\1\rprovider\19git_diff_added\fenabled\0\1\0\1\afg\vfg_sec\1\0\0\0\1\0\1\afg\vbg_sec\1\0\1\rprovider\tî‚¼ \1\0\2\afg\afg\abg\vbg_sec\1\0\0\topts\1\0\3\ttype\rrelative\23file_readonly_icon\tï€£ \17colored_icon\1\1\0\1\tname\14file_info\1\0\2\afg\vaccent\abg\vbg_sec\1\0\1\rprovider\tî‚¼ \ahl\1\0\3\abg\vaccent\afg\abg\nstyle\tbold\rprovider\1\0\0\0\1\0\1\15signcolumn\1\nsetup\rgitsigns\vfeline\fpalette\23features.ui.colors\frequire\0", "config", "feline.nvim")
time([[Config for feline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nš\1\0\1\3\2\4\0\21-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\v€-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4€-\1\1\0009\1\3\1B\1\1\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\19expand_or_jump\23expand_or_jumpable\21select_next_item\fvisibleŽ\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4€-\1\0\0009\1\1\1B\1\1\1X\1\r€-\1\1\0009\1\2\1)\3ÿÿB\1\2\2\15\0\1\0X\2\5€-\1\1\0009\1\3\1)\3ÿÿB\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\1À\tjump\rjumpable\21select_prev_item\fvisible-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\1À\tbody\15lsp_expand\5\1\0\f\0&\0C6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\2B\2\1\0013\2\5\0003\3\6\0009\4\a\0005\6\t\0005\a\b\0=\a\n\0065\a\v\0=\a\f\0065\a\14\0003\b\r\0=\b\15\a=\a\16\0064\a\0\0=\a\17\0065\a\20\0009\b\18\0009\b\19\bB\b\1\2=\b\21\a9\b\18\0009\b\22\bB\b\1\2=\b\23\a9\b\18\0009\b\24\bB\b\1\2=\b\25\a9\b\18\0009\b\26\b5\n\27\0B\b\2\2=\b\28\a9\b\18\0\18\n\2\0005\v\29\0B\b\3\2=\b\30\a9\b\18\0\18\n\3\0005\v\31\0B\b\3\2=\b \a=\a\18\0064\a\5\0005\b!\0>\b\1\a5\b\"\0>\b\2\a5\b#\0>\b\3\a5\b$\0>\b\4\a=\a%\6B\4\2\0012\0\0€K\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\tpath\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\f<S-Tab>\1\3\0\0\6i\6s\n<Tab>\1\3\0\0\6i\6s\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\18documentation\fsnippet\vexpand\1\0\0\0\fsorting\1\0\1\20priority_weight\3\1\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noinsert\nsetup\0\0\tload luasnip.loaders.from_vscode\fluasnip\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\2\n’\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\31auto_session_suppress_dirs\1\2\0\0\6~\18pre_save_cmds\1\0\0\1\2\0\0\18NvimTreeClose\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: ctrlsf.vim
time([[Config for ctrlsf.vim]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\arg\18ctrlsf_ackprg\6g\bvim\0", "config", "ctrlsf.vim")
time([[Config for ctrlsf.vim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n”\2\0\0\5\0\v\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\4\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\5\0B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\6\0005\2\t\0005\3\b\0005\4\a\0=\4\4\3=\3\n\2B\0\2\1K\0\1\0\15extensions\1\0\0\1\0\0\1\0\4\28override_generic_sorter\2\nfuzzy\2\14case_mode\15smart_case\25override_file_sorter\2\nsetup\17session-lens\bfzf\6z\19load_extension\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
try_loadstring("\27LJ\2\n¾\5\0\0\4\0\23\0A6\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\5\0B\1\2\0029\1\6\1=\1\3\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\t\1=\1\a\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\v\1=\1\n\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\r\1=\1\f\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\15\1=\1\14\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\b\0B\1\2\0029\1\17\1=\1\16\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\20\1=\1\18\0006\0\0\0009\0\1\0009\0\2\0006\1\4\0'\3\19\0B\1\2\0029\1\22\1=\1\21\0K\0\1\0\22workspace_handler\21workspace/symbol\21document_handler\20lsputil.symbols textDocument/documentSymbol\27implementation_handler textDocument/implementation\27typeDefinition_handler textDocument/typeDefinition\24declaration_handler\29textDocument/declaration\23definition_handler\28textDocument/definition\23references_handler\22lsputil.locations\28textDocument/references\24code_action_handler\23lsputil.codeAction\frequire\28textDocument/codeAction\rhandlers\blsp\bvim\0", "config", "nvim-lsputils")
time([[Config for nvim-lsputils]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\nÀ\1\0\0\4\0\v\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\0\0'\2\6\0B\0\2\0029\0\a\0005\2\b\0005\3\t\0=\3\n\2B\0\2\1K\0\1\0\16diagnostics\1\0\1\venable\2\1\0\2\15update_cwd\2\18disable_netrw\1\nsetup\14nvim-tree\tauto\15signcolumn\fwinopts\tView\19nvim-tree.view\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n–\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\a\0\0\thelp\vnofile\fnowrite\rquickfix\rterminal\vprompt\1\0\1\tchar\aÂ¦\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: tabby.nvim
time([[Config for tabby.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\5\0\6\0\r'\0\0\0006\1\1\0009\1\2\0019\1\3\0016\3\1\0009\3\2\0039\3\4\3B\3\1\2'\4\5\0B\1\3\2'\2\0\0&\0\2\0L\0\2\0\a:t\vgetcwd\16fnamemodify\afn\bvim\6 ;\0\1\4\0\3\0\0056\1\0\0009\1\1\0019\1\2\1\18\3\0\0D\1\2\0\28nvim_tabpage_get_number\bapi\bvim|\0\1\6\2\b\0\0175\1\6\0'\2\0\0-\3\0\0\18\5\0\0B\3\2\2'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\1\0009\3\2\3=\3\4\2-\3\1\0009\3\5\3=\3\2\2=\2\a\1L\1\2\0\3À\0À\ahl\1\0\0\15accent_sec\afg\1\0\1\nstyle\tbold\abg\6 \n ïƒˆ x\0\1\6\2\b\0\0175\1\6\0'\2\0\0-\3\0\0\18\5\0\0B\3\2\2'\4\1\0&\2\4\2>\2\1\0015\2\3\0-\3\1\0009\3\2\3=\3\2\2-\3\1\0009\3\4\3=\3\5\2=\2\a\1L\1\2\0\3À\0À\ahl\1\0\0\abg\vbg_sec\1\0\1\nstyle\tbold\afg\6 \n ï‚– x\0\1\6\2\t\0\0185\1\a\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\6\2=\2\b\1L\1\2\0\1À\0À\ahl\1\0\0\abg\vbg_sec\1\0\0\afg\6 \vunique\n ï†’ x\0\1\6\2\t\0\0185\1\a\0'\2\0\0-\3\0\0009\3\1\3\18\5\0\0B\3\2\2'\4\2\0&\2\4\2>\2\1\0015\2\4\0-\3\1\0009\3\3\3=\3\3\2-\3\1\0009\3\5\3=\3\6\2=\2\b\1L\1\2\0\1À\0À\ahl\1\0\0\abg\vbg_sec\1\0\0\afg\6 \vunique\n ï„Œ ¦\a\1\0\t\0;\0Ž\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0023\2\4\0003\3\5\0005\4\t\0005\5\a\0009\6\6\0=\6\6\0059\6\b\0=\6\b\5=\5\n\0044\5\3\0005\6\r\0>\2\1\0065\a\v\0009\b\b\0=\b\6\a9\b\f\0=\b\b\a=\a\n\6>\6\1\0055\6\14\0005\a\15\0009\b\f\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6>\6\2\5=\5\16\0045\5\18\0003\6\17\0=\6\19\0055\6\20\0005\a\22\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6\24\0005\a\25\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5\27\0045\5\29\0003\6\28\0=\6\19\0055\6\30\0005\a \0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6!\0005\a\"\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5#\0045\5%\0003\6$\0=\6\19\0055\6&\0005\a'\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6(\0005\a)\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\5*\0045\5,\0003\6+\0=\6\19\0055\6-\0005\a.\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\23\0055\6/\0005\a0\0009\b\31\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6=\6\26\5=\0051\0044\5\3\0005\0062\0005\a3\0009\b\21\0=\b\6\a9\b\b\0=\b\b\a=\a\n\6>\6\1\0055\0064\0005\a5\0009\b\b\0=\b\6\a9\b\21\0=\b\b\a=\a\n\6>\6\2\5=\0056\0046\5\0\0'\a7\0B\5\2\0029\0058\0055\a9\0=\4:\aB\5\2\0012\0\0€K\0\1\0\ftabline\1\0\0\nsetup\ntabby\ttail\1\0\0\1\2\0\0\n ïƒ¶ \1\0\0\1\2\0\0\bî‚º\bwin\1\0\0\1\2\0\0\bî‚¼\1\0\0\1\2\0\0\bî‚º\1\0\0\0\ftop_win\1\0\0\1\2\0\0\bî‚¼\1\0\0\1\2\0\0\bî‚º\1\0\0\0\17inactive_tab\1\0\0\1\2\0\0\bî‚¼\1\0\0\vbg_sec\1\2\0\0\bî‚º\1\0\0\0\15active_tab\14right_sep\1\0\0\1\2\0\0\bî‚¼\rleft_sep\1\0\0\15accent_sec\1\2\0\0\bî‚º\nlabel\1\0\0\0\thead\1\0\0\1\2\0\0\bî‚¼\1\0\0\vaccent\1\0\0\ahl\1\0\1\vlayout\24active_wins_at_tail\abg\1\0\0\afg\0\0\19tabby.filename\fpalette\23features.ui.colors\frequire\0", "config", "tabby.nvim")
time([[Config for tabby.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n…\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType fish ++once lua require("packer.load")({'vim-fish'}, { ft = "fish" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript.jsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascript.jsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript.tsx ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescript.tsx" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'go.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'emmet-vim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'go.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'emmet-vim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/crows/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], true)
vim.cmd [[source /Users/crows/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]]
time([[Sourcing ftdetect script at: /Users/crows/.local/share/nvim/site/pack/packer/opt/vim-fish/ftdetect/fish.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
