if has("multi_byte")
    set fileencodings&
    set fileencodings-=latin1
    set fileencodings-=default
    set fileencodings-=utf-8
    set fileencodings-=ucs-bom

    set fileencodings+=ucs-bom
    set fileencodings+=utf-8
    set fileencodings+=chinese
    set fileencodings+=japanese
    set fileencodings+=korean
    set fileencodings+=default
    set fileencodings+=latin1
endif
