all: runAsm main

runAsm: runAsm.c runAsmParser.tab.c runAsmParser.tab.h
	gcc -o runAsm runAsm.c runAsmParser.tab.c

runAsm.c: runAsmLexer.l
	flex -o runAsm.c runAsmLexer.l

runAsmParser.tab.h runAsmParser.tab.c: runAsmParser.y
	bison -d runAsmParser.y

cleanrunAsm:
	$(RM) runAsm.c runAsm runAsmParser.tab.c runAsmParser.tab.h


main: lex.yy.c y.tab.c main.c
	gcc -o main lex.yy.c y.tab.c main.c

lex.yy.c: mainLexer.l
	flex mainLexer.l

y.tab.c: mainParser.y
	bison -y -d mainParser.y


cleanmain:
	$(RM) lex.yy.c y.tab.c y.tab.h main

cleanall: cleanrunAsm cleanmain
