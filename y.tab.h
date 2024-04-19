/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     PROGRAM = 258,
     DATATYPES = 259,
     VAR = 260,
     TO = 261,
     DOWNTO = 262,
     IF = 263,
     THEN = 264,
     ELSE = 265,
     ARRAY = 266,
     WHILE = 267,
     WRITE = 268,
     READ = 269,
     FOR = 270,
     DO = 271,
     BEG = 272,
     END = 273,
     OF = 274,
     DNUMBER = 275,
     FNUMBER = 276,
     VARIABLE = 277,
     ARITHOP = 278,
     RELOP = 279,
     BOOLOP = 280,
     STRINGCONT = 281,
     SEMICOL = 282,
     FULLSTOP = 283,
     COL = 284,
     OPENBRACK = 285,
     CLOSEBRACK = 286,
     COMMA = 287,
     OPENSQBRACK = 288,
     CLOSESQBRACK = 289,
     EQUALSTO = 290,
     ERR = 291
   };
#endif
/* Tokens.  */
#define PROGRAM 258
#define DATATYPES 259
#define VAR 260
#define TO 261
#define DOWNTO 262
#define IF 263
#define THEN 264
#define ELSE 265
#define ARRAY 266
#define WHILE 267
#define WRITE 268
#define READ 269
#define FOR 270
#define DO 271
#define BEG 272
#define END 273
#define OF 274
#define DNUMBER 275
#define FNUMBER 276
#define VARIABLE 277
#define ARITHOP 278
#define RELOP 279
#define BOOLOP 280
#define STRINGCONT 281
#define SEMICOL 282
#define FULLSTOP 283
#define COL 284
#define OPENBRACK 285
#define CLOSEBRACK 286
#define COMMA 287
#define OPENSQBRACK 288
#define CLOSESQBRACK 289
#define EQUALSTO 290
#define ERR 291




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

