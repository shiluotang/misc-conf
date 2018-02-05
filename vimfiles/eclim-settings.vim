""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" eclim settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(expand('<sfile>:p:h') . '/plugin/eclim.vim')
    if has("autocmd")
        autocmd filetype java map <buffer> <LocalLeader>es :JavaSearch<CR>
        autocmd filetype java map <buffer> <LocalLeader>eS :JavaSearchContext<CR>
        autocmd filetype java map <buffer> <LocalLeader>ef :JavaFormat<CR>
        autocmd filetype java map <buffer> <LocalLeader>eF :%JavaFormat<CR>
        autocmd filetype java map <buffer> <LocalLeader>ei :JavaImport<CR>
        autocmd filetype java map <buffer> <LocalLeader>eI :JavaImportOrganize<CR>
        autocmd filetype java map <buffer> <LocalLeader>ed :JavaDocPreview<CR>
        autocmd filetype java map <buffer> <LocalLeader>eD :JavaDocSearch<CR>
        autocmd filetype java map <buffer> <LocalLeader>eh :JavaHierarchy<CR>
        autocmd filetype java map <buffer> <LocalLeader>ec :JavaCallHierarchy<CR>
        autocmd filetype java map <buffer> <LocalLeader>eC :JavaCallHierarchy!<CR>
        autocmd filetype java map <buffer> <LocalLeader>ev :Validate<CR>
        autocmd filetype java map <buffer> <LocalLeader>ep :JavaImpl<CR>

        " add bean methods
        autocmd filetype java map <buffer> <LocalLeader>eba :JavaGetSet<CR>
        autocmd filetype java map <buffer> <LocalLeader>ebg :JavaGet<CR>
        autocmd filetype java map <buffer> <LocalLeader>ebs :JavaSet<CR>

        " other things
        autocmd filetype java setlocal textwidth=80 formatoptions+=tm
    endif
    " disable eclim all languages validation
    let g:EclimFileTypeValidate = 0
    let g:EclimMakeLCD = 1
endif
