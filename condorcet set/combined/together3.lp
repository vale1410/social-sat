#hide. 

#show dir/2. 
#const n=5. 

#show rank/3. 
#const m=5. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dominating Set             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

node(1..n). 

set(A,B,C) :- node(A;B;C), A<B, B<C, A<C. 

1 { dir(A,B), dir(B,A) } 1 :- node(A;B), A != B. 


% D dominates all nodes in the set {A,B,C}
dominate(D,A,B,C) :- dir(D,A), dir(D,B), dir(D,C), set(A,B,C). 
dominated(A,B,C) :-  dominate(_,A,B,C). 

% for each set A,B,C there has to be a D. 
:- set(A,B,C), not dominated(A,B,C). 

%:- node(A), not (n-1)/2 { dir(A,_) } (n+1)/2. 
%:- node(B), not (n-1)/2 { dir(_,B) } (n+1)/2. 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Rankings                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

voter(1..m). 

node(X) :- X = 1..n. 

pair(A1,A2) :- A1 < A2 , node(A1;A2).

{ rank(V,A1,A2) } :- pair(A1,A2), voter(V). 


% max one out
:- rank(V,A1,A2), rank(V,A1,A3), A2 != A3. 
:- rank(V,A1,A3), rank(V,A2,A3), A1 != A2. 

:- voter(V), pair(A2,A1), pair(A3,A1), not rank(V,A2,A1), not rank(V,A3,A1), A2 != A3. 
:- voter(V), pair(A3,A1), pair(A3,A2), not rank(V,A3,A1), not rank(V,A3,A2), A1 != A2. 

% transitive
:- rank(V,A1,A2), rank(V,A2,A3), not rank(V,A1,A3). 
:- pair(A2,A1), pair(A3,A2), not rank(V,A2,A1), not rank(V,A3,A2), rank(V,A3,A1). 

:- dir(A1,A2), pair(A1,A2), { rank(V,A1,A2) } (m-1)/2 . 

