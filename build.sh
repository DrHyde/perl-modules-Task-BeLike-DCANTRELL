#!/usr/bin/env bash

head -$(grep -n __DATA__ Makefile.PL |sed 's/:.*//') Makefile.PL > Makefile.PL.new
mv Makefile.PL.new Makefile.PL

for i in $(grep -ahr ^use ~/Documents/checkouts/perlscripts/|sed 's/^use //;s/;.*//;s/ .*//'|grep -vE '(^[5a-z]|^Config$|News::Article|NNTP)'|sort|uniq); do corelist -v 5.012 $i; done|grep undef$|awk '{print $1}' >> Makefile.PL

ls ..|grep -E '^[A-Z]'|grep -vE '^(Acme|File-Overwrite|Unix-Sudo|Tie-Hash-(Longest|Rank)|Tie-Scalar-Decay|NestedMap|Games-Dice-Advanced|IP-World|Net-Random|Task-BeLike-DCANTRELL|XML-Tiny|Class-DBI|^Palm-)'|sed 's/-/::/g' >> Makefile.PL

echo Devel::NYTProf >> Makefile.PL
echo Devel::Cover >> Makefile.PL

