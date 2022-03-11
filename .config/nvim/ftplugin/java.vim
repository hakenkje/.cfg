if exists('b:did_ftplugin')
    finish
endif

setlocal tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=

let b:undo_ftplugin = 'setlocal tabstop< softtabstop< shiftwidth< colorcolumn<'
