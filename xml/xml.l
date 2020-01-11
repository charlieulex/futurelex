

%start COMMENT INITIAL2

bom     \xEF\xBB\xBF
white   [ \t]

u2a     [\xC2-\xDF][\x80-\xBF]
u2b     \xE0[\xA0-\xBF][\x80-\xBF]
u3a     [\xE1-\xEC\xEE\xEF][\x80-\xBF]{2}
u3b     \xED[\x80-\x9F][\x80-\xBF]
u4a     \xF0[\x90-\xBF][\x80-\xBF]{2}
u4b     [\xF1-\xF3][\x80-\xBF]{3}
u4c     \xF4[\x80-\x8F][\x80-\xBF]{2}

utf_8   {u2a}|{u2b}|{u3a}|{u3b}|{u4a}|{u4b}|{u4c}

%%
<INITIAL>"<"   BEGIN INITIAL2;
<INITIAL2>"!" BEGIN COMMENT;
<INITIAL2>[A-Za-z_0-9\- \t\"=.>&?;#{}:,/]* {printf("%s",yytext);}
<INITIAL1>{utf_8}  {printf("%s",yytext);}
<INITIAL2>"/>" { printf("\n");BEGIN INITIAL; }
<COMMENT>. {}
<COMMENT>\n { BEGIN INITIAL; }

\n		{ }
.		{ }
%%

main()
{
  yylex();
}
