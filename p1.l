%{
int ln=0,sp=0,wr=0,ch=0,tc=0;
%}
%%
[" "] {sp++;}
[\t] {tc++;}
[\n] {ln++;}
[a-zA-Z0-9][" "] {wr++;sp++;ch++;}
[a-zA-Z0-9][\n] {wr++;ln++;ch++;}
[a-zA-Z0-9][\t] {wr++;tc++;ch++;}
[a-zA-Z0-9] {ch++;}
%%
int yywrap(){}
int main(int argc,int *argv[])
{
yylex();
printf("Lines:%d\nWords:%d\nSpaces:%d\nCharacters:%d\nTabs:%d\n",ln,wr,sp,ch,tc);
return 0;
}
