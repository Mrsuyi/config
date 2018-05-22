%option noyywrap
%option always-interactive
%option reentrant
%option bison-bridge

%top {
#define YYSTYPE int
}

%{
#include "skel.parser.h"
%}

DIGIT [0-9]
WORD  [0-9a-zA-Z_]
BLANK [ \t\n]

%%

{DIGIT}+ { *yylval = atoi(yytext); return INT; }
.        { ; }

%%
