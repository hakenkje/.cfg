
if exists('b:did_ftplugin')
    finish
endif

setlocal foldenable
setlocal foldlevel=0

let b:undo_ftplugin = 'setlocal foldenable< foldlevel<'
