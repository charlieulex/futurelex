#!/bin/bash
echo begin
flex utils.l
cc lex.yy.c -ll
#cat a.txt | ./a.out
cat u3c_acd.log | ./a.out
echo end