
%start COMMENT STRING_LITERAL_STATE
%%
<INITIAL>"<"   BEGIN COMMENT;
<COMMENT>[A-Za-z_0-9\- \t\"=.>&?;#{}:]* {printf("%s\n",yytext);}
<COMMENT>"/>" { BEGIN INITIAL; }

\n		{ }
.		{ }
%%

main()
{
  yylex();
}
