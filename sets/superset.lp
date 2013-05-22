

set(S) :- element(S,_). 

superset(S1,S2) :- set(S1;S2), element(S1,A) : element(S2,A). 
