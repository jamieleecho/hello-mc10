#/usr/bin/bash

for each in *.bas; do mcbasic $each && tasm6801 ${each%.*}.asm; done
