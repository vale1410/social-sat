#!/bin/zsh

i=1; 

gringo sets.lp  | clasp 0 | grep contains | while read x; do echo $x \
                | sed 's/$/./g' |sed 's/ /./g' \
                | sed -e s/num/"s$i"/g; i=$((1+$i)) ; done
