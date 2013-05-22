#!/bin/zsh

i=1; 

rm -fr tmp.lp

gringo sets.lp --const n=$1 | clasp 0 | grep contains | while read x; do echo $x \
                | sed 's/$/./g' |sed 's/ /./g' \
                | sed -e s/num/"s$i"/g >> tmp.lp; i=$((1+$i))  ; done

gringo -t tmp.lp superset.lp > $2
