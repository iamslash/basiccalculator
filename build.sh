yacc -dv cal.y
lex cal.l
cc y.tab.c lex.yy.c -o cal.out
