%{
    #include <stdio.h>
    #include "y.tab.h"

    int COMMENT= 0;
    int n_line = 1;

    extern char* yytext;
    void yyerror(char const *s){
        fprintf(stderr, "ERROR : %s\n" ,s);
    }

%}

id [a-zA-Z][a-zA-Z0-9]*

%%

\n                      {n_line++;} 

#.*                     { return (INCLUDE); }

"/*"                    {COMMENT=1;}
"*/"                    {COMMENT=0;}
"//".*                  ;

\{                      {if(!COMMENT) return (LBRACE); }
\}                      {if(!COMMENT) return (RBRACE); }

\( 	                    {if(!COMMENT) return (LPAREN); }
\) 	                    { return (RPAREN); }

\[                      {if(!COMMENT) return (LBRACKET); }   
\]                      {if(!COMMENT) return (RBRACKET); }

\,                      {if(!COMMENT) return (COMMA); }
\;                      {if(!COMMENT) return (SEMI); }

\+                      {if(!COMMENT) return (PLUS); }
\-                      {if(!COMMENT) return (MINUS); }
\/                      {if(!COMMENT) return (DIV); }
\%\%                    {if(!COMMENT) return (MOD); }
\*                      {if(!COMMENT) return (MULT); }
\*\*                    {if(!COMMENT) return (POW); }
 
\+\+                    {if(!COMMENT) return (INCREMENT); }
\-\-                    {if(!COMMENT) return (DECREMENT); }
 
\+\=                    {if(!COMMENT) return (PLUS_ASSIGN); }
\-\=                    {if(!COMMENT) return (MINUS_ASSIGN); }
\*\=                    {if(!COMMENT) return (MULT_ASSIGN); }
\/\=                    {if(!COMMENT) return (DIV_ASSIGN); }
 
\&\& | 
and                     {if(!COMMENT) return (AND); }
 
\|\| | 
or	                    {if(!COMMENT) return (OR); }
 
\!                      {if(!COMMENT) return (NOT); }   
\=\=                    {if(!COMMENT) return (EQUAL); }
\!\=                    {if(!COMMENT) return (DIFF); }
 
\<=                     {if(!COMMENT) return (LESS_EQUAL_THAN); }
\>=                     {if(!COMMENT) return (MORE_EQUAL_THAN); }
\<                      {if(!COMMENT) return (LESS_THAN); }
\>                      {if(!COMMENT) return (MORE_THAN); } 
     
=                       {if(!COMMENT) return (ASSIGN); }
     
int                     {if(!COMMENT) return (INT); }
float                   {if(!COMMENT) return (FLOAT); }                 
char                    {if(!COMMENT) return (CHAR); }
double                  {if(!COMMENT) return (DOUBLE); }
long                    {if(!COMMENT) return (LONG); }
void                    {if(!COMMENT) return (VOID); }
     
if                      {if(!COMMENT) return (IF); }
else                    {if(!COMMENT) return (ELSE); }
for                     {if(!COMMENT) return (FOR); }
while                   {if(!COMMENT) return (WHILE); }
return                  {if(!COMMENT) return (RETURN); }
     
{id}                    {if(!COMMENT) yylval.let = yytext; return (ID); }
\".*\"                  {if(!COMMENT) return (yytext[0]); }
[0-9]+                  {if(!COMMENT) yylval.num = atoi(yytext); return (NUM); }
[+-]?[0-9]+"."[0-9]*    {if(!COMMENT) return (REAL); }

[ \t]                   {;}
.                       {yyerror("Unexpected token..!");}

%%

#ifndef yywrap
   int yywrap (void) {return 1;}
#endif