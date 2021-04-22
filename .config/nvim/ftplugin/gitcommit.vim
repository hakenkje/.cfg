
if exists('b:did_ftplugin')
    finish
endif

setlocal spell
setlocal colorcolumn=72

let b:undo_ftplugin = 'setlocal spell< colorcolumn<'
