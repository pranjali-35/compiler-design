%{
int n=0;
%}
DIGIT [0-9]
NUMBER {DIGIT}+
REAL {DIGIT}*"."{DIGIT}+
TEXT [a-zA-Z ]+
TEXT_NUMBERS [a-zA-Z0-9]
CONDITIONALS "if"|"else"|"else if"|"switch"|"case"
KEYWORD "void"|"break"|"continue"|"goto"|"printf"|"scanf"|"sprintf"|"sscanf"|"fopen"|"fwrite"|"fread"|"fclose"|"write"|"read"|"open"|"close"|"return"|"int"|"float"|"char"|"unsigned"|"signed"|"short"|"long"|"double"
ITERATORS "for"|"while"|"do"
PREPROCESSOR "#"|"#line"|"#undef"|"#error"|"#elif"|"#else"|"#endif"|"#if"|"#define"|"#include"|"#pragma"|"#ifndef"|"#ifdef"
DELIMITER [;:\t\n()"]
IDENTIFIER [a-zA-Z]{TEXT_NUMBERS}*|[a-zA-Z]{TEXT_NUMBERS}*[[{NUMBER}+]]
FORMAT_SPECIFIER "%"{TEXT_NUMBERS}+
FILE "<"{IDENTIFIER}.h">"
COMMENT "/*"[a-zA-Z0-9 \t\n;.~!@#$%^&*()_+=<>?:"{}]*"*/"
AOPERATORS "+"|"-"|"*"|"/"|"="
BLOCK_BEGINS "{"
BLOCK_ENDS "}"
UNARY "++"|"--"
LOPERATORS "&&"|"||"|"!"
BOPERATORS "&"|"|"|"~"
ROPERATORS ">"|"<"|">="|"<="|"=="
FUNCTION {IDENTIFIER}+"("{DELIMITER}*{TEXT}{TEXT_NUMBERS}*{DELIMITER}*")"
%%
{NUMBER} {n++;printf("Integer Number: %s\n",yytext);}
{REAL} {n++;printf("Float Number: %s\n",yytext);}
{KEYWORD} {n++;printf("Keyword : %s\n",yytext);}
{IDENTIFIER} {n++;printf("Identifier: %s\n",yytext);}
{CONDITIONALS} {n++;printf("Conditional Operator: %s\n",yytext);}
{ITERATORS} {n++;printf("Iterator : %s\n",yytext);}
{AOPERATORS} {n++;printf("Arithematic Operator : %s\n",yytext);}
{UNARY} {n++;printf("Unary Operator : %s\n",yytext);}
{BLOCK_BEGINS} {n++;printf("Block Begin : %s\n",yytext);}
{BLOCK_ENDS} {n++;printf("Block End : %s\n",yytext);}
{LOPERATORS} {n++;printf("Logical Operator : %s\n",yytext);}
{ROPERATORS} {n++;printf("Realtional Operator : %s\n",yytext);}
{BOPERATORS} {n++;printf("Bitwise Operator : %s\n",yytext);}
{PREPROCESSOR} {n++;printf("Preprocessor : %s\n",yytext);}
{DELIMITER} {n++;printf("Delimeter : %s\n",yytext);}
{FORMAT_SPECIFIER} {n++;printf("Format Specifier : %s\n",yytext);}
{FUNCTION} {n++;printf("Function : %s\n",yytext);}
{FILE} {n++;printf("File : %s\n",yytext);}
{COMMENT} {n++;printf("Comments : %s\n",yytext);}
%%
int yywrap(){}
main()
{
    extern FILE *yyin;
    yyin=fopen("Input.c","r");
    yylex();
    printf("Total Number of Tokens: %d\n",n);
    return 0;
}
