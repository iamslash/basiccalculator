yacc -dv cal.y
lex cal.l
cc -o cal.out y.tab.c lex.yy.c
