all: build
build:	
	flex json.l
	bison -y -d json.y
	gcc y.tab.c lex.yy.c -o json2xml
clean:
	rm lex.yy.c y.tab.c y.tab.h
