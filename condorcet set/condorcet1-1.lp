#hide. 
#show dir/2. 
#const n=3. 

node(1..n). 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 

:- node(A), { dir(A,D) : node(D) } 0.
