local M = {}

-- Carregar paleta de cores
M.palette = require('seafoam-pastel.palette')

-- Configuração padrão
M.config = {
  transparent_background = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    functions = { italic = false },
    variables = {},
    keywords = { italic = true },
    strings = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    telescope = true,
    cmp = true,
    lsp_trouble = true,
    which_key = true,
    indent_blankline = true,
    nvim_tree = true,
    barbar = false,
    gitgutter = false,
    gitsigns = true,
    leap = false,
    lightspeed = false,
    lsp_saga = false,
    neo_tree = true,
    notify = true,
    semantic_tokens = true,
    symbols_outline = true,
    telekasten = false,
    treesitter = true,
    ts_rainbow = true,
  }
}

-- Aplicar configurações
M.setup = function(user_config)
  M.config = vim.tbl_deep_extend('force', M.config, user_config or {})
end

-- Aplicar o scheme
M.load = function()
  -- Definir as cores do terminal se necessário
  if M.config.terminal_colors then
    M.set_terminal_colors()
  end

  -- Aplicar o colorscheme
  vim.cmd('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'seafoam-pastel'

  M.set_highlights()
end

-- Configurar cores do terminal
M.set_terminal_colors = function()
  vim.g.terminal_color_0 = M.palette.black
  vim.g.terminal_color_1 = M.palette.red
  vim.g.terminal_color_2 = M.palette.green
  vim.g.terminal_color_3 = M.palette.yellow
  vim.g.terminal_color_4 = M.palette.blue
  vim.g.terminal_color_5 = M.palette.magenta
  vim.g.terminal_color_6 = M.palette.cyan
  vim.g.terminal_color_7 = M.palette.white
  vim.g.terminal_color_8 = M.palette.bright_black
  vim.g.terminal_color_9 = M.palette.bright_red
  vim.g.terminal_color_10 = M.palette.bright_green
  vim.g.terminal_color_11 = M.palette.bright_yellow
  vim.g.terminal_color_12 = M.palette.bright_blue
  vim.g.terminal_color_13 = M.palette.bright_magenta
  vim.g.terminal_color_14 = M.palette.bright_cyan
  vim.g.terminal_color_15 = M.palette.bright_white
end

-- Definir todos os highlights
M.set_highlights = function()
  local bg = M.config.transparent_background and 'NONE' or M.palette.background
  local highlights = {
    -- Grupos base
    Normal = { fg = M.palette.foreground, bg = bg },
    NormalFloat = { fg = M.palette.foreground, bg = M.palette.surface0 },
    FloatBorder = { fg = M.palette.blue, bg = M.palette.surface0 },
    Comment = { fg = M.palette.bright_black, bg = bg, italic = M.config.styles.comments.italic },

    -- Cursor
    Cursor = { fg = M.palette.background, bg = M.palette.foreground },
    CursorLine = { bg = M.palette.surface0 },
    CursorColumn = { bg = M.palette.surface0 },

    -- Números de linha
    LineNr = { fg = M.palette.bright_black },
    CursorLineNr = { fg = M.palette.bright_yellow },

    -- Busca
    Search = { fg = M.palette.background, bg = M.palette.bright_yellow },
    IncSearch = { fg = M.palette.background, bg = M.palette.bright_green },

    -- Sintaxe
    Statement = { fg = M.palette.bright_magenta, italic = M.config.styles.keywords.italic },
    Keyword = { fg = M.palette.bright_magenta, italic = M.config.styles.keywords.italic },
    Conditional = { fg = M.palette.bright_magenta, italic = M.config.styles.keywords.italic },
    Repeat = { fg = M.palette.bright_magenta, italic = M.config.styles.keywords.italic },
    Label = { fg = M.palette.bright_magenta },
    Operator = { fg = M.palette.bright_magenta },
    Function = { fg = M.palette.bright_blue, italic = M.config.styles.functions.italic },
    Identifier = { fg = M.palette.bright_blue },
    Constant = { fg = M.palette.bright_red },
    String = { fg = M.palette.bright_green },
    Character = { fg = M.palette.bright_green },
    Number = { fg = M.palette.bright_red },
    Boolean = { fg = M.palette.bright_red },
    Float = { fg = M.palette.bright_red },

    -- Tipos
    Type = { fg = M.palette.bright_cyan },
    Structure = { fg = M.palette.bright_cyan },
    StorageClass = { fg = M.palette.bright_cyan },
    Typedef = { fg = M.palette.bright_cyan },

    -- Destaques especiais
    Special = { fg = M.palette.bright_red },
    SpecialChar = { fg = M.palette.bright_red },
    Tag = { fg = M.palette.bright_red },
    Delimiter = { fg = M.palette.foreground },
    SpecialComment = { fg = M.palette.bright_black, italic = true },
    Debug = { fg = M.palette.bright_red },

    -- Diferenciais
    DiffAdd = { fg = M.palette.bright_green, bg = M.palette.surface0 },
    DiffChange = { fg = M.palette.bright_yellow, bg = M.palette.surface0 },
    DiffDelete = { fg = M.palette.bright_red, bg = M.palette.surface0 },
    DiffText = { fg = M.palette.bright_blue, bg = M.palette.surface0 },

    -- Status line
    StatusLine = { fg = M.palette.foreground, bg = M.palette.cursor },
    StatusLineNC = { fg = M.palette.bright_black, bg = M.palette.cursor },

    -- Pmenu (autocompletion)
    Pmenu = { fg = M.palette.foreground, bg = M.palette.surface0 },
    PmenuSel = { fg = M.palette.background, bg = M.palette.bright_blue },
    PmenuSbar = { bg = M.palette.surface1 },
    PmenuThumb = { bg = M.palette.bright_black },

    -- Erros e avisos
    ErrorMsg = { fg = M.palette.bright_red },
    WarningMsg = { fg = M.palette.bright_yellow },
    ModeMsg = { fg = M.palette.foreground },
    MoreMsg = { fg = M.palette.bright_blue },

    -- Separadores verticais
    VertSplit = { fg = M.palette.bright_black, bg = bg },

    -- Tabline
    TabLine = { fg = M.palette.bright_black, bg = M.palette.surface0 },
    TabLineSel = { fg = M.palette.foreground, bg = bg },
    TabLineFill = { bg = bg },

    -- Match paren
    MatchParen = { fg = M.palette.bright_red, bg = M.palette.cursor },

    -- Visual selection
    Visual = { bg = M.palette.cursor },
    VisualNOS = { bg = M.palette.cursor },

    -- Fold
    Folded = { fg = M.palette.bright_black, bg = M.palette.surface0 },
    FoldColumn = { fg = M.palette.bright_black, bg = bg },

    -- Sign column (gutter)
    SignColumn = { fg = M.palette.bright_black, bg = bg },

    -- Conceal
    Conceal = { fg = M.palette.bright_black },

    -- Spell
    SpellBad = { undercurl = true, sp = M.palette.bright_red },
    SpellCap = { undercurl = true, sp = M.palette.bright_yellow },
    SpellLocal = { undercurl = true, sp = M.palette.bright_blue },
    SpellRare = { undercurl = true, sp = M.palette.bright_green },

    -- Quickfix
    QuickFixLine = { bg = M.palette.cursor },

    -- Non-text
    NonText = { fg = M.palette.bright_black },
    SpecialKey = { fg = M.palette.bright_black },

    -- Whitespace
    Whitespace = { fg = M.palette.surface1 },

    -- Directory
    Directory = { fg = M.palette.bright_blue },

    -- Title
    Title = { fg = M.palette.bright_blue },

    -- Wild menu
    WildMenu = { fg = M.palette.background, bg = M.palette.bright_blue },

    -- Git
    gitcommitSummary = { fg = M.palette.bright_green },
    gitcommitOverflow = { fg = M.palette.bright_red },
  }

  -- Aplicar os highlights
  for group, properties in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, properties)
  end

  -- Integrações
  M.set_integrations()
end

-- Configurar integrações com plugins
M.set_integrations = function()
  if M.config.integrations.telescope then
    -- Telescope highlights
    local telescope_highlights = {
      TelescopeBorder = { fg = M.palette.bright_black, bg = bg },
      TelescopeNormal = { bg = bg },
      TelescopeSelection = { fg = M.palette.foreground, bg = M.palette.cursor },
    }
    for group, properties in pairs(telescope_highlights) do
      vim.api.nvim_set_hl(0, group, properties)
    end
  end

  if M.config.integrations.nvim_tree then
    -- NvimTree highlights
    local nvim_tree_highlights = {
      NvimTreeNormal = { fg = M.palette.foreground, bg = M.palette.surface0 },
      NvimTreeRootFolder = { fg = M.palette.bright_blue },
      NvimTreeGitDirty = { fg = M.palette.bright_yellow },
      NvimTreeGitNew = { fg = M.palette.bright_green },
      NvimTreeGitDeleted = { fg = M.palette.bright_red },
    }
    for group, properties in pairs(nvim_tree_highlights) do
      vim.api.nvim_set_hl(0, group, properties)
    end
  end
end

return M
