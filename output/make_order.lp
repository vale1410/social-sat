#hide. 
#show order/3. 

pair(X,Y) :- rank(_,X,Y). 

node(X) :- pair(X,_). 
node(Y) :- pair(_,Y). 

voter(A) :- rank(A,_,_). 

r(A,X,Y) :- rank(A,X,Y). 
r(A,Y,X) :- voter(A), pair(X,Y), not rank(A,X,Y). 


between(A,X,Y,Z) :- r(A,X,Y), r(A,Y,Z). 

order(A,X,Z) :- r(A,X,Z), { between(A,X,Y,Z) : node(Y) } 0. 
