%{
#define YYERROR_VERBOSE 1

#include <stdio.h>

int yylex();
void yyerror(const char *);

%}

%union {
   char * s;
}

%token EGAL SLASH SUP SUPSPECIAL DOCTYPE COLON INFSPECIAL INF CDATABEGIN
%token <s> VALEUR DONNEES COMMENT NOM CDATAEND

%type<s> document
%type<s> element



%%

document
  : element
  {
    printf("do\n");
  }
  | document element
  {
    printf("do2\n");
  }
  ;
element
  : INF NOM SLASH SUP
  {
    printf("element\n");
  }
  ;

%%

void yyerror(const char *s) {
  printf("\n%s\n",s);
}

int main(void) {
  yyparse();
  return 0;
}

