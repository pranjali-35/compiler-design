%{
int m=0,n=0;
%}
DIGIT [0-9]
%%
{DIGIT}* {printf("%s is an integer\n",yytext);m++;}
{DIGIT}*?\.{DIGIT}* {printf("%s is float\n",yytext);n++;}
%%
int yywrap(){}
int main(int argc,int *argv[])
{
yylex();
printf("Total Integers : %d\nTotal Float : %d\n",m,n);
return 0;
}
