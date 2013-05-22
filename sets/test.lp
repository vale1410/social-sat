alternative(a;b;c).
set(a;b;c;ab;ac;bc;abc).

superset(abc,ab;ac;bc).
superset(A,B) :- contains(A,B).

contains(abc,a;b;c).

contains(ab,a;b).

contains(ac,a;c).

contains(bc,b;c).

contains(ab,a;b).

contains(A,A) :- alternative(A). 
