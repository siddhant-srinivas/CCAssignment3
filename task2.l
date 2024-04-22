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
<COMMENT>{STATEMENT1} {;}

"program"   { return PROGRAM; }
"integer"|"real"|"boolean"|"char"   { return DATATYPES; }   
"var"       { return VAR; }
"to"        { return TO; }
"downto"    { return DOWNTO; }
"if"        { return IF; }
"then"      { return THEN; }
"else"      { return ELSE; }
"while"     { return WHILE; }
"write"     { return WRITE; }
"writeln"   { return WRITE; }
"read"      { return READ; }
"for"       { return FOR; }
"do"        { return DO; }
"array"     { return ARRAY; }
"begin"     { return BEG; }
"end"       { return END; }
"of"        { return OF; }
{dNUMBER}   { return DNUMBER;}
{fNUMBER}   { return FNUMBER;}
{BOOLEAN_OPERATOR}   { return BOOLOP; }
{IDENTIFIER} { return VARIABLE;}
{ARITHMETIC_OPERATOR}   { return ARITHOP; }
=           { return EQUALSTO; }
{RELATIONAL_OPERATOR}   { return RELOP; }
{INVERTEDC}{STATEMENT}{INVERTEDC} { return STRINGCONT; }
;           { return SEMICOL;}
"."         { return FULLSTOP; }
:           { return COL; }
"("         { return OPENBRACK; }
")"         { return CLOSEBRACK; }
,           { return COMMA; }
"["         { return OPENSQBRACK; }
"]"         { return CLOSESQBRACK; }

[ \t\n]     {;}
.           {}
%%