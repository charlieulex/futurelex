#!/bin/bash
echo begin
bison -dv mycalc.y
flex mycalc.l
cc -o mycalc.exe mycalc.tab.c lex.yy.c -ll
echo end