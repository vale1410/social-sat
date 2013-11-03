#!/bin/zsh 

t=6
timeout=1800

mkdir -p log 

for x in {10..70}
do  
    out=log/log_$x.txt
    echo $out
    gringo dom_2_3cycle.lp -c n=$x  | clasp -t $t --stat --configuration=chatty --time-limit=$timeout > $out
done

