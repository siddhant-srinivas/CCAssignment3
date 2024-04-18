%{
#include <stdio.h>
struct {
    int lineno;
} yyline = {1};
%}

%option caseless

DIGIT       [0-9]
LETTER      [a-zA-Z]
IDENTIFIER  {LETTER}({LETTER}|{DIGIT}|_)*
NUMBER      {DIGIT}+(\.{DIGIT}+)?
OPERATOR    (\+|\-|\*|\/|=|:=|<|>|<=|>=|<>|%|AND|OR|NOT)
KEYWORD     (program|integer|real|boolean|char|var|to|downto|if|else|while|write|read|for|do|array|and|or|not|begin|end|of)
PUNCTUATOR  ";"|":"|"("|")"|","|"."|"["|"]"
STATEMENT   [^\"\n]*
%x IN_QUOTES

%%
[ \t] {;}
[\n] {yyline.lineno++; }
"//"    {;}
{OPERATOR} {printf("%d\t %s\t operator\n", yyline.lineno, yytext); }
"end." {printf("%d\t end\t keyword\n", yyline.lineno);
	printf("%d\t .\t puntuator\n", yyline.lineno);
	yyterminate();}
{KEYWORD} { printf("%d\t %s\t keyword\n", yyline.lineno, yytext);}
{DIGIT}+  { printf("%d\t %s\t number\n", yyline.lineno, yytext);}
{IDENTIFIER} { printf("%d\t %s\t identifier\n", yyline.lineno, yytext);}
{PUNCTUATOR} {printf("%d\t %s\t punctuator\n", yyline.lineno, yytext);}
\" {printf("%d\t %s\t punctuator\n", yyline.lineno, yytext);
		BEGIN IN_QUOTES;}

<IN_QUOTES>\" {printf("%d\t %s\t punctuator\n", yyline.lineno, yytext);
		BEGIN INITIAL;}		
<IN_QUOTES>{STATEMENT} {printf("%d\t %s\t statement\n", yyline.lineno, yytext);}

%%

int main(){
    yyin = fopen("input.pas", "r"); 
    if(yyin == NULL) {
        printf("Error opening input file.\n");
        return 1;
    }

    printf("Line Number \t Lexeme \t Token \n");
    yylex();
    fclose(yyin);
    return 0;
}

int yywrap(){return(1);}
