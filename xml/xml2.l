%{
#include "y.tab.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int lineNumber = 1;
%}
%option noyywrap
letter [a-zA-Z]
digit [0-9]
other_characters [./_-]
whitespace [ \t]
newline [\n]
string ({letter}|{digit}|{other_characters})({letter}|{digit}|{other_characters})+
%%
"ss:Workbook"       {printf("%s", yytext); return WORKBOOK;}
"ss:Styles"     {printf("%s", yytext); return STYLES;}
"\/ss:Style"        {printf("%s", yytext); return CLOSINGSTYLE;}
"ss:Style"      {printf("%s", yytext); return STYLE;}
"<"     {printf("%s", yytext); return START;}
">"     {printf("%s", yytext); return CLOSE;}
"/"     {printf("%s", yytext); return SLASH;}
{string}({whitespace}|{string})*    {printf ("%s", yytext); return KEIMENO;}
"ss:ID\="\"{string}\"       {printf("%s", yytext); return ID;}
{whitespace}        {printf(" "); } /* This is to deal with whitespaces */
{newline}       {printf("\n");lineNumber++; } /*Counting line*/
"<!--"[^-]*"-->"        {printf("%s",yytext); } /* this is to deal with comments */
%%