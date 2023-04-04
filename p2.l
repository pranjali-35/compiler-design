%{
int count=0;
%}
spe [+!@#$%^&*(){}\|'',./?~]
letter [a-zA-Z_]
digit [0-9]
id ({letter}+{digit}*)+
notid ({digit}+{letter}*)+
notid2 ({letter}{digit}{spe}+{letter}{digit})+
%%
("int")|("float")|("char")|("case")|("default")|("if")|("for")|("printf")|("scanf") {printf("%s is a keyword\n",yytext);}

{notid} {printf("%s is not a identifier\n",yytext);}
{notid2} {printf("%s is not a identifier\n",yytext);}
{id} {printf("%s is a identifier\n",yytext);count++;}
{digit}* {printf("%s is not a identifier\n",yytext);}
%%
int yywrap(){return 1;}
int main()
{
yylex();
printf("Total Number of Identifiers: %d\n",count);
return 0;
}
