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
%type<s> comm



%%

document
  : comm
  {

  }
  | element
  {
    printf("do\n");
  }
  | document comm
  {

  }
  | document element
  {
    printf("do2\n");
  }
  ;
element
  : INF NOM SLASH SUP
  {
    printf("element %s\n",$2);
  }
  ;
comm
  : COMMENT
  {
    printf("comment %s\n",$1);
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

