let g:vimwiki_list = [{'path': '~/Dropbox/Wiki/', 'syntax': 'markdown', 'ext': '.md'}]
" au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab
let g:vimwiki_global_ext = 0

map <Leader>tt <Plug>VimwikiToggleListItem

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
    map <Leader>wd <Plug>VimwikiDiaryGenerateLinks
augroup end
