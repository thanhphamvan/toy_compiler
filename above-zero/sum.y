%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#define YYSTYPE int
%}

%token NUMBER
%token MINUS
%token SEPARATOR
%token LEFT RIGHT
%token END

%left SEPARATOR
%left NEG

%start Input
%%

Input:

     | Input Line
;

Line:
     END
     | Expression END { printf("Result: %d\n", $1); }
;

Expression:
     NUMBER { $$=$1; }
| Expression SEPARATOR Expression { $$=$1+$3; }
| MINUS Expression %prec NEG { $$=0; }
| LEFT Expression RIGHT { $$=$2; }
| LEFT RIGHT { $$=0; }
;
%%

int yyerror(char *s) {
  printf("%s\n", s);
}

int main() {
  if (yyparse())
     fprintf(stderr, "Stop.\n");
  else
     fprintf(stderr, "error found.\n");
}
