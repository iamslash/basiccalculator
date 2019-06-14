%union {
  int    int_value;
  double double_value;
}
%token <double_value> DOUBLE_LITERAL
%token ADD SUB MUL DIV NL
%type <double_value> expression term primary_expression

%{
#include <stdio.h>
#include <stdlib.h>
#define YYDEBUG 1

void yyerror(char*);
int yylex(void);
%}

%%
line_list : line
          | line_list line
          ;
line : expression NL
     {
       printf(">>%lf\n", $1);
     }
     ;
expression : term
           | expression ADD term
           {
             $$ = $1 + $3;
           }
           | expression SUB term
           {
             $$ = $1 - $3;
           }
           ;
term : primary_expression 
     | term MUL primary_expression
     {
       $$ = $1 * $3;
     }
     | term DIV primary_expression
     {
       $$ = $1 / $3;
     }
     ;
primary_expression : DOUBLE_LITERAL
                   ;
%%
void yyerror(char *s) {
  printf("%s\n", s);
  return 0;
}

int main(void) {
  yyparse();
  return 0;
}