" seafoam-pastel.vim - Seafoam Pastel colorscheme for Neovim

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'seafoam-pastel'
set background=dark

lua require('seafoam-pastel').load()
