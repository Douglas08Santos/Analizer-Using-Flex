id [a-zA-Z][a-zA-Z0-9]*

%%

\n                   {yylineno++;} 

#.*                   return INCLUDE;

"//".*                  ;

\{                    return LBRACE;
\}                    return RBRACE;

\( 	                  return LPAREN;
\) 	                  return RPAREN;

\[                    return LBRACKET;   
\]                    return RBRACKET;

\,                    return COMMA;
\;                    return SEMI;

\+                    return PLUS;
\-                    return MINUS;
\/                    return DIV;
\%\%                  return MOD;
\*                    return MULT;
\*\*                  return POW;

\+\+                  return INCREMENT;
\-\-                  return DECREMENT;

\+\=                  return PLUS_ASSIGN;
\-\=                  return MINUS_ASSIGN;
\*\=                  return MULT_ASSIGN;
\/\=                  return DIV_ASSIGN;

\&\& |
and                   return AND;

\|\| |
or	                  return OR;

\!                    return NOT;    
\=\=                  return EQUAL;
\!\=                  return DIFF;

\<=                   return LESS_EQUAL_THAN;
\>=                   return MORE_EQUAL_THAN;
\<                    return LESS_THAN;
\>                    return MORE_THAN; 

=                     return ASSIGN;

int                   return INT;
float                 return FLOAT;                 
char                  return CHAR;
double                return DOUBLE;
long                  return LONG;
void                  return VOID;

if                    return IF;
else                  return ELSE;
for                   return FOR;
while                 return WHILE;
return                return RETURN;

{id}                  return ID;
\".*\"                return yytext[0];
[0-9]+                return NUM;
[+-]?[0-9]+"."[0-9]*  return REAL;

[^ \t]                 ;

%%

