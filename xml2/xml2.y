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
%type<s> sub_element
%type<s> Attribute_0_N



%%

document
  : comm
  | element
  | document comm
  | document element
  ;
element
  : INF NOM Attribute_0_N SLASH SUP
  {
    printf("element %s\n",$2);
  }
  | INF NOM Attribute_0_N SUP content INF SLASH NOM SUP
  {
    printf("element compote %s - %s\n",$2,$8);
  }
  ;
content
  : sub_element
  | content element
  | content comm
  ;
sub_element
  :
  {
  }
  ;
Attribute_0_N
  : Attribute_0_N NOM EGAL VALEUR
  {
    printf("attr %s %s\n",$2,$4);
  }
  |
  {
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

