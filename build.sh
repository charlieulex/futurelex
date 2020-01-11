#!/bin/bash
echo begin
flex utils.l
cc lex.yy.c -ll
cat a.txt | ./a.out
echo end