%{
int count=0;
%}
op [+-*/]
letter [a-zA-Z_]
digit [0-9]
id ({letter}+{digit}*)+
notid ({digit}+{letter}*)+

%%
[\t\n]+
("int")|("float")|("scanf")|("printf")|("if") {printf("%s is a keyword\n",yytext);}
{id} {printf("%s is an identifier\n",yytext);count++;}
{notid} {printf("%s is not an identifier\n",yytext);}
%%
int yywrap(){}
int main(int argc,int *argv[])
{
yylex();
printf("Total number of identifiers:%d\n",count);
return 0;
}
