#!/bin/zsh

source prll.sh                      
timeout=20000

mkdir -p log

argument=()

for n in {21,23,25}
do
    for m in {15,17,19,21,23,25,27}
    do 
<<<<<<< HEAD:condorcet set/search.sh
        a=$n' '$m
        argument+=($a)
=======
        gringo condorcet2.lp --const n=$n --const m=$m  | clasp --time-limit=200 -t 3 --stat --configuration=jumpy > \
            log/r-$n-$m.log
>>>>>>> bab625f3a034e6007408753ab25d8e5b63692037:condorcet set/condorcet/search.sh
    done 
done

myfn() {
    x1=$(echo $1 | cut -d' ' -f1)
    x2=$(echo $1 | cut -d' ' -f2)
    gringo cond-pref3-2.lp --const n=$x1 --const m=$x2  |  clasp --stat -t 3,split --configuration=chatty --time-limit=$timeout > \
            log/r-$x1-$x2-$timeout.log
}
 
prll -c 2 myfn $argument
