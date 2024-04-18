%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<string.h>
    #include"lex.yy.c"

    typedef struct{
        char token[100];
    } symbolEntry;

    symbolEntry symbolTable[1000];
    int symbolCount = 0;

    void addToSymbolTable(char* name) {
        strcpy(symbolTable[symbolCount].token, name);
        symbolCount++;
    }

    int syntaxErr = 0;
    extern int yylex();
    extern char* yytext;
    void yyerror(const char *str);
%}

%token PROGRAM DATATYPES VAR TO DOWNTO IF THEN ELSE ARRAY WHILE WRITE READ FOR DO BEG END OF DNUMBER FNUMBER VARIABLE ARITHOP RELOP BOOLOP STRINGCONT SEMICOL FULLSTOP COL OPENBRACK CLOSEBRACK COMMA OPENSQBRACK CLOSESQBRACK EQUALSTO

%%

program :   P V R FULLSTOP
        ;

P       :   PROGRAM VARIABLE SEMICOL
        ;
    
V       :   VAR var_lines
        ;

var_lines   :   var_lines var_line
            |   var_line
            ;

var_line    :   declaration_list COL var_types SEMICOL
            ;

declaration_list    :   declaration_list COMMA VARIABLE
                    |   VARIABLE
                    ;

var_types   :   DATATYPES
            |   ARRAY OPENSQBRACK DNUMBER FULLSTOP FULLSTOP DNUMBER CLOSESQBRACK OF DATATYPES
            ;

R   :   BEG CODEBLOCK END 
    ;
   
CODEBLOCK   :   statements BEG statements END statements SEMICOL
            |   statements
            |   BEG statements END SEMICOL
            |   statements BEG statements END SEMICOL
            |   BEG statements END statements SEMICOL
            ;

statements  :   statements statement
            |   statement
            ;

statement   :   assignment_statement
            |   if_block_statement
            |   while_statement
            |   write_statement
            |   read_statement
            |   for_statement
            ;

assignment_statement    :   varinstance COL EQUALSTO expression SEMICOL
                        ;

expression  :   DNUMBER
            |   FNUMBER
            |   varinstance
            |   expression ARITHOP expression
            |   OPENBRACK expression CLOSEBRACK
            ;

if_block_statement  :   if_statement else_statement 
                    ;

if_statement    :   IF condition THEN BEG CODEBLOCK END 
                ;

else_statement  :   ELSE BEG CODEBLOCK END SEMICOL
                |   SEMICOL
                ;

condition   :   relation_condition
            |   boolean_condition   
            ;

varinstance     :   VARIABLE
                |   VARIABLE OPENSQBRACK DNUMBER CLOSESQBRACK
                |   VARIABLE OPENSQBRACK VARIABLE CLOSESQBRACK
                ;

relation_condition    :   expression relo expression
                        ;

relo        :   RELOP
            |   EQUALSTO
            ;

boolean     :   OPENBRACK relation_condition CLOSEBRACK
            |       relation_condition
            ;

boolean_condition   :   boolean_condition BOOLOP boolean
                    |   varinstance COL EQUALSTO boolean_condition
                    |   boolean
                    ;

write_statement     :   WRITE OPENBRACK STRINGCONT CLOSEBRACK SEMICOL
                    |   WRITE OPENBRACK declaration_list CLOSEBRACK SEMICOL
                    ;

read_statement      :   READ OPENBRACK varinstance CLOSEBRACK SEMICOL
                    ;

while_statement     :   WHILE OPENBRACK condition CLOSEBRACK DO BEG CODEBLOCK END SEMICOL
                    |   WHILE condition DO BEG CODEBLOCK END SEMICOL
                    ;

for_statement       :   FOR VARIABLE COL EQUALSTO expression TO expression DO BEG CODEBLOCK END SEMICOL
                    |   FOR VARIABLE COL EQUALSTO expression DOWNTO expression DO BEG CODEBLOCK END SEMICOL
                    ;

%%



void yyerror(const char *s) {
    syntaxErr = 1;
    fprintf(stderr, "%s at line %d, column %d\n", s, yylineno, yyleng);
}

int main() {
    yyin = fopen("input.pas", "r"); 
    if(yyin == NULL) {
        printf("Error opening input file.\n");
        return 1;
    }

    yyparse();
    if(syntaxErr == 0){
        printf("No syntax error");
    }
    fclose(yyin);
    return 0;
}