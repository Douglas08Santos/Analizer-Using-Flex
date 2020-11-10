/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

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

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    INCLUDE = 258,
    LBRACE = 259,
    LBRACKET = 260,
    LPAREN = 261,
    RPAREN = 262,
    RBRACKET = 263,
    RBRACE = 264,
    COMMA = 265,
    SEMI = 266,
    PLUS = 267,
    MINUS = 268,
    MULT = 269,
    DIV = 270,
    MOD = 271,
    POW = 272,
    ASSIGN = 273,
    INCREMENT = 274,
    DECREMENT = 275,
    PLUS_ASSIGN = 276,
    MINUS_ASSIGN = 277,
    MULT_ASSIGN = 278,
    DIV_ASSIGN = 279,
    AND = 280,
    OR = 281,
    NOT = 282,
    EQUAL = 283,
    DIFF = 284,
    LESS_EQUAL_THAN = 285,
    MORE_EQUAL_THAN = 286,
    LESS_THAN = 287,
    MORE_THAN = 288,
    INT = 289,
    FLOAT = 290,
    CHAR = 291,
    DOUBLE = 292,
    LONG = 293,
    VOID = 294,
    FOR = 295,
    WHILE = 296,
    IF = 297,
    ELSE = 298,
    RETURN = 299,
    NUM = 300,
    ID = 301,
    REAL = 302
  };
#endif
/* Tokens.  */
#define INCLUDE 258
#define LBRACE 259
#define LBRACKET 260
#define LPAREN 261
#define RPAREN 262
#define RBRACKET 263
#define RBRACE 264
#define COMMA 265
#define SEMI 266
#define PLUS 267
#define MINUS 268
#define MULT 269
#define DIV 270
#define MOD 271
#define POW 272
#define ASSIGN 273
#define INCREMENT 274
#define DECREMENT 275
#define PLUS_ASSIGN 276
#define MINUS_ASSIGN 277
#define MULT_ASSIGN 278
#define DIV_ASSIGN 279
#define AND 280
#define OR 281
#define NOT 282
#define EQUAL 283
#define DIFF 284
#define LESS_EQUAL_THAN 285
#define MORE_EQUAL_THAN 286
#define LESS_THAN 287
#define MORE_THAN 288
#define INT 289
#define FLOAT 290
#define CHAR 291
#define DOUBLE 292
#define LONG 293
#define VOID 294
#define FOR 295
#define WHILE 296
#define IF 297
#define ELSE 298
#define RETURN 299
#define NUM 300
#define ID 301
#define REAL 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 11 "analyzer.y"

  int num;
  char *let;

#line 156 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
