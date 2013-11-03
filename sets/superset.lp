

set(S) :- contains(S,_). 

superset(S1,S2) :- set(S1;S2), contains(S1,A) : contains(S2,A). 
