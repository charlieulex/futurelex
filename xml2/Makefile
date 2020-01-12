all: build
build:
	flex xml2.l
	bison -y -d xml2.y
	gcc y.tab.c lex.yy.c -o xml2
clean:
	rm xml2 lex.yy.c y.tab.c y.tab.h
