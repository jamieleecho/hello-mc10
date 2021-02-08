#/usr/bin/bash

for each in *.bas; do
	mcbasic $each
	tasm6801 ${each%.*}.asm
	bastoc10 $each $each.c10
done
