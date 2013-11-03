#!/bin/bash

mkdir -p log

for n in {10..30}
do
    for m in {7,9,11,13,15,17,19,21,23,25,27,29}
    do 
        gringo condorcet2.lp --const n=$n --const m=$m  | clasp --time-limit=200 -t 3 --stat --configuration=jumpy > \
            log/r-$n-$m.log
    done 
done
