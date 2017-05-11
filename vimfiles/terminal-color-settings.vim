if (&term == "xterm") || (&term == "screen")
    let &t_Co=256
    "let &t_AF="\e[38;5;%dm"
    "let &t_AB="\e[48;5;%dm"
    "let &t_Sb="\e[4%dm"
    "let &t_Sf="\e[3%dm"
endif
