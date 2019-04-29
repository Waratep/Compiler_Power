all: asmGen main

asmGen: asmGen.c asmGenParser.tab.c asmGenParser.tab.h
	gcc -o asmGen asmGen.c asmGenParser.tab.c

asmGen.c: asmGenLexer.l
	flex -o asmGen.c asmGenLexer.l

asmGenParser.tab.h asmGenParser.tab.c: asmGenParser.y
	bison -d asmGenParser.y

cleanasmGen:
	$(RM) asmGen.c asmGen asmGenParser.tab.c asmGenParser.tab.h


main: lex.yy.c y.tab.c main.c
	gcc -o main lex.yy.c y.tab.c main.c

lex.yy.c: mainLexer.l
	flex mainLexer.l

y.tab.c: mainParser.y
	bison -y -d mainParser.y


cleanmain:
	$(RM) lex.yy.c y.tab.c y.tab.h main

A3: asmGen main

cleanall: cleanasmGen cleanmain
