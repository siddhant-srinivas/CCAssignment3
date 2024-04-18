# CCAssignment3

## Compiling the YACC program

To compile the yacc program, follow these instructions:

1. In terminal, download the yacc file and the corresponding lex file onto a directory.

2. Navigate to that directory

3. Run the following commands in the bash terminal

'''bash

yacc -d task2.y                     #Generates y.tab.c and y.tab.h files
lex task2.l                         #Generates lexer
cc y.tab.c -ll -w -o yaccTask       #Compiles the lex and yacc files
./yaccTask                          #Runs the yacc program

