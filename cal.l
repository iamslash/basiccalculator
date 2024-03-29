%{
#include <stdio.h>
#include "y.tab.h"

int yywrap() {
  return 1;
}
%}

%%
'+'  return ADD;
'-'  return SUB;
'*'  return MUL;
'\/' return DIV;
'\n' return NL;

(([1-9][0-9]*)|0)(\.[0-9]*)? {
  double temp;
  sscanf(yytext, '%lf', &temp);
  yylval.double_value = temp;
  return DOUBLE_LITERAL;
};

[ \t] ;

. yyerror("Invalid Character");
%%

int yywrap(void) {
  return 1;
}