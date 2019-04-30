%{
#include <stdlib.h>
#include "main.h"
#include "y.tab.h"


static int64_t strToHex(char* s);

void comment(int i);

void yyerror(char *);
char text[500];
%}

%x S

%%

0           {
                yylval.iValue = atoi(yytext);
                return INTEGER;
            }

[0-9]+[dD]* {
                yylval.iValue = (int64_t)atoi(yytext);
                return INTEGER;
            }

[0-9a-fA-F]+[hH]* {
                yylval.iValue = strToHex(yytext);
                return INTEGER;
            }

[-()<>=+*/,;{}.%\[\]@] {
                return *yytext;
             }

"makgua"        return GE;
"noigua"        return LE;
"thaogun"        return EQ;
"maithaogun"        return NE;
"thumsum"     return WHILE;
"tha"        return IF;
"maikor"      return ELSE;
"lae"        return AND;
"reu"        return OR;
"return"    return RETURN;
"sadangDln"      return PUTI;
"sadangD"     return PUTI_;
"sadangHln"      return PUTH; 
"sadangH"     return PUTH_; 
"sadangCln"      return PUTC;
"sadangC"     return PUTC_;
"sadangSln"      return PUTS;
"sadangS"     return PUTS_;
"geti"      return GETI;
"getc"      return GETC;
"gets"      return GETS;
"array"     return ARRAY;

    /*\/\/.*\n    ; skip comments */

\"		{ BEGIN S; *text = 0; }
<S>[^"\\]*	{ strcat(text, yytext); }
<S>\"		{ yylval.sValue = text; BEGIN 0; return STRING; }
<S>\\\"		{ strcat(text, "\\\""); }
<S>\\n		{ strcat(text, "\\n"); }
<S>\\t		{ strcat(text, "\\t"); }
<S>\\		{ strcat(text, "\\\\"); }

[ \t\n]+    {}       /* ignore whitespace */

'\\n'		{ yylval.sValue = "\'\\n\'"; return CHARACTER; }
'\\t'		{ yylval.sValue = "\'\\t\'"; return CHARACTER; }
'\\''		{ yylval.sValue = "\'\\'\'"; return CHARACTER; }
''		{ yylval.sValue = "\'\'"; return CHARACTER; }
'.'		{ yylval.sValue = (char *) malloc(yyleng * sizeof(char));
		  memcpy(yylval.sValue, yytext, yyleng);
		  return CHARACTER; }

"/*"	             { comment(1);}
"//"	             { comment(2);}

[a-zA-Z][a-zA-Z0-9]{0,11} {
                yylval.vName = (char *) malloc(yyleng * sizeof(char));
		int i;
		for (i=0; i<yyleng; i++){
		    yylval.vName[i] = yytext[i];
		}
		yylval.vName[yyleng] = '\0';
                return VARIABLE;
	    }


.           {};

%%

static int64_t strToHex(char* s) {
  int len = strlen(s);
  s[len-1] = 0;
  return (int64_t)( strtol(s, NULL, 16) );
}

void comment(int i)
{
    int c;
    while((c = input()) != 0){
        if(i == 1){
            if(c == '*'){
                if((c = input()) == '/')
                    break;
                else
                    unput(c);
            }
        }else if(i == 2){
            if(c != 0){
                if((c = input()) == '\n')
                    break;
                else
                    unput(c);
            }
        }
    }
}

int yywrap(void) {
    return 1;
}

