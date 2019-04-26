#!/bin/bash

ulimit -s unlimited

for kind in 4 8 16;
do
	for typ in n b d e;
	do
	./mull $typ $kind > res/$typ$kind
	done
done
