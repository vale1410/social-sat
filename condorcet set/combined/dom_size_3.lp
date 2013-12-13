#hide. 
#show dir/2. 
#const n=23. 

node(1..n). 

set(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 


% D dominates all nodes in the set {A,B,C}
dominate(D,A,B,C) :- dir(D,A), dir(D,B), dir(D,C), set(A,B,C). 
dominated(A,B,C) :-  dominate(_,A,B,C). 

% for each set A,B,C there has to be a D. 
:- set(A,B,C), not dominated(A,B,C). 

:- node(A), not (n-1)/2 { dir(A,_) } (n+1)/2. 
:- node(B), not (n-1)/2 { dir(_,B) } (n+1)/2. 

%% no three cycle is allowed!
cycle(A,B,C) :- dir(A,B), dir(B,C), dir(C,A), A<B, A<C, B != C. 

#minimize{cycle(_,_,_)}. 
