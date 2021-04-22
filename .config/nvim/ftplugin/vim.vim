if exists('b:did_ftplugin')
    finish
endif

setlocal foldmethod=marker

let b:undo_ftplugin = 'setlocal foldmethod<'
