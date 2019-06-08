%{
#define YYSTYPE int
#include "sum.tab.h"
#include <stdlib.h>
%}

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}

%%

{white} {}
{integer} {
  yylval=atof(yytext);
  return NUMBER;
}

"-" return MINUS;
"," return SEPARATOR;
"(" return LEFT;
")" return RIGHT;
"\n" return END;
