%{
%}
%%
"//"[^\n]* ;
"/*"([^*]|[*]+[^/])*[*]+"/" ;
. fprintf(yyout,"%s",yytext);
%%
int yywrap(){}
int main(int argc,int *argv[])
{
extern FILE *yyin,*yyout;
yyin = fopen("input1.c","r");
yyout = fopen("out1.c","w");
yylex();
}
