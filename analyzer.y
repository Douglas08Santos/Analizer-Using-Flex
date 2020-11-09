%{
#include <stdio.h>
#include <stdlib.h>

extern FILE *fp;
%}

%token INCLUDE
%token LBRACE LBRACKET LPAREN RPAREN RBRACKET RBRACE
%token COMMA SEMI
%token PLUS MINUS MULT DIV MOD POW ASSIGN
%token INCLEMENT DECREMENT
%token PLUS_ASSIGN MINUS_ASSIGN MULT_ASSIGN DIV_ASSIGN
%token AND OR
%token NOT EQUAL DIFF
%token LESS_EQUAL_THAN MORE_EQUAL_THAN LESS_THAN MORE_THAN
%token INT FLOAT CHAR DOUBLE LONG VOID
%token FOR WHILE IF ELSE RETURN
%token NUM ID REAL

%left PLUS MINUS
%left MULT DIV
%right POW
%right ASSIGN
%left AND OR
%left LESS_THAN MORE_THAN LESS_EQUAL_THAN MORE_EQUAL_THAN EQUAL DIFF
%%

Instr: Func_decl 
    | Stmts
    ;

/*Bloco de declaração*/
Stmts: Type Assignment ';'
    | Assignment ';'
    | FunctionCall ';'
    | ArrayUse ';'
    | Type ArrayUse ';'
    | error
    ;

/*Bloco de Atribuição*/
Assignment: ID ASSIGN Assignment
    | ID ASSIGN FunctionCall
    | ID ASSIGN ArrayUse
    | ArrayUse = Assignment
    | ID COMMA Assignment
    | NUM COMMA Assignment
    | ID PLUS Assignment
    | ID MINUS Assignment
    | ID PLUS Assignment
    | ID DIV Assignment
    | NUM PLUS Assignment
    | NUM MINUS Assignment
    | NUM PLUS Assignment
    | NUM DIV Assignment
    | LPAREN Assignment RPAREN
    | MINUS LPAREN Assignment RPAREN
    | MINUS NUM
    | MINUS ID
    |   NUM
	|   ID
    ;

/*Chamada de função*/
FunctionCall: ID LPAREN RPAREN
    |   ID LPAREN Assignment RPAREN
    ;

/*Chamada de vetor*/
ArrayUse: ID LBRACKET Assignment RBRACKET
    ;

/*Definição de Função*/
Func_decl: Type ID LPAREN ParamListOpt RPAREN LBRACE StmtList RBRACE
    ;

ParamListOpt: ParamList
    |
    ;
ParamList: ParamList COMMA Param
    | Param
    ;
Param: Type ID
    ;
StmtList: StmtList Stmt
    |
    ;
Stmt: While_Stmt
    | Stmts
    | For_Stmt
    | If_Stmt
    | SEMI
    ;

/*identificador de tipo*/
Type: INT
    | FLOAT
    | CHAR
    | DOUBLE
    | VOID
    | LONG
    ; 

/*Loops*/
While_Stmt: WHILE LPAREN Logic_Expr RPAREN Stmt
    |  WHILE LPAREN Logic_Expr RPAREN LBRACE StmtList RBRACE
    ;

/*Bloco For*/
For_Stmt: FOR LPAREN Logic_Expr SEMI Logic_Expr; Logic_Expr RPAREN Stmt
    | FOR LPAREN Logic_Expr SEMI Logic_Expr; Logic_Expr RPAREN LBRACE StmtList RBRACE
    ;

/*Bloco IF-ELSE*/
If_Stmt: IF LPAREN Logic_Expr RPAREN
        Stmt
    | IF LPAREN Logic_Expr RPAREN LBRACE StmtList RBRACE
    ;

/*Expressões Lógicas*/
Logic_Expr:
    | Logic_Expr LESS_THAN Logic_Expr
    | Logic_Expr MORE_THAN Logic_Expr
    | Logic_Expr DIFF Logic_Expr
    | Logic_Expr EQUAL Logic_Expr
    | Logic_Expr MORE_EQUAL_THAN Logic_Expr
    | Logic_Expr LESS_EQUAL_THAN Logic_Expr
    | Assignment
    | ArrayUse
    ;
%%

#include"lex.yy.c"
#include<ctype.h>
int count=0;

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1], "r");
	
   if(!yyparse())
		printf("\nParsing complete\n");
	else
		printf("\nParsing failed\n");
	
	fclose(yyin);
    return 0;
}
         
yyerror(char *s) {
	printf("%d : %s %s\n", yylineno, s, yytext );
}
