%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
400_organ1  {printf("organ1\n");}
[a-zA-Z]+	{ words++; chars += strlen(yytext); }
\n		{ chars++; lines++; }
.		{ chars++; }

%%

main()
{
  yylex();
  printf(" %8d line  %8d word  %8d chars\n", lines, words, chars);
}
