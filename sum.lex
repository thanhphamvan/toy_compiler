%{
#define YYSTYPE double
#include "sum.tab.h"
#include <stdlib.h>
%}

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%

{white} {}
{real} {
  yylval=atof(yytext);
  return NUMBER;
}

"-" return MINUS;
"," return SEPARATOR;
"(" return LEFT;
")" return RIGHT;
"\n" return END;
