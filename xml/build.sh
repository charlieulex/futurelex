#!/bin/bash
echo ======================begin
flex xml.l
cc lex.yy.c -ll
#cat a.txt | ./a.out
cat my_vars.xml | ./a.out
echo ======================end