" seafoam-pastel.vim - Plugin loader

if exists('g:loaded_seafoam_pastel')
  finish
endif
let g:loaded_seafoam_pastel = 1

command! -bang SeafoamPastelSetup lua require('seafoam-pastel').setup(<bang>0)
