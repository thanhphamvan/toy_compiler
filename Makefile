calc: sum.y sum.lex
	bison -d sum.y
	flex  -o sum.lex.c sum.lex
	gcc  -o sum sum.lex.c sum.tab.c -lfl -lm
