%{
#include <stdio.h>
struct {
    int lineno;
} yyline = {1};
#include"y.tab.h"
%}

%option caseless noyywrap

DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT}|_)*
dNUMBER     {DIGIT}+
fNUMBER     {DIGIT}+(\.{DIGIT}+)
ARITHMETIC_OPERATOR    (\+|\-|\*|\/|%)
RELATIONAL_OPERATOR    (=|<|>|<=|>=|<>)
BOOLEAN_OPERATOR       (and|or|not)
KEYWORD     (program|integer|real|boolean|char|var|to|downto|if|else|while|write|read|for|do|array|begin|end|of)
PUNCTUATOR  ";"|":"|"("|")"|","|"."|"["|"]"
STATEMENT   [^\"\n]*
STATEMENT1  [^\n]*
INVERTEDC \"

%x IN_QUOTES
%x COMMENT
%%

"//"    {BEGIN COMMENT;}
<COMMENT>\n {BEGIN INITIAL;}
<COMMENT>{STATEMENT1} {printf("%s\t comment\n"yytext);}

"program"   { return PROGRAM; }
"integer"|"real"|"boolean"|"char"   { return DATATYPES; }   
"var"       { return VAR; }
"to"        { return TO; }
"downto"    { return DOWNTO; }
"if"        { return IF; }
"then"      { return THEN; }
"else"      { return ELSE; }
"while"     { printf("%s\n", yytext); return WHILE; }
"write"     { printf("%s\n", yytext); return WRITE; }
"read"      { printf("%s\n", yytext); return READ; }
"for"       { return FOR; }
"do"        { return DO; }
"array"     { return ARRAY; }
"begin"     { printf("%s\n", yytext); return BEG; }
"end"       { printf("%s\n", yytext); return END; }
"of"        { return OF; }
{dNUMBER}   { printf("%s\n", yytext);  return DNUMBER;}
{fNUMBER}   { return FNUMBER;}
{BOOLEAN_OPERATOR}   { return BOOLOP; }
{IDENTIFIER} { printf("%s\n", yytext); return VARIABLE;}
{ARITHMETIC_OPERATOR}   { printf("%s\n", yytext); return ARITHOP; }
=           { return EQUALSTO; }
{RELATIONAL_OPERATOR}   { printf("%s\n", yytext); return RELOP; }
{INVERTEDC}{STATEMENT}{INVERTEDC} { printf("%s\n", yytext); return STRINGCONT; }
;           { printf("%s\n", yytext);  return SEMICOL;}
"."         { return FULLSTOP; }
:           { return COL; }
"("         { return OPENBRACK; }
")"         { printf("%s\n", yytext); return CLOSEBRACK; }
,           { return COMMA; }
"["         { return OPENSQBRACK; }
"]"         { return CLOSESQBRACK; }

[ \t\n]     {;}
.           {}
%%