#hide. 
#show rank/4. 
#show wel/3. 

alt(A) :- rank(_,_,A,_). 
alt(B) :- rank(_,_,_,B). 
voter(V) :- rank(_,V,_,_). 
s(S) :- rank(S,_,_,_). 

1 { wel(S,A,B), wel(S,B,A)  } 1 :- A < B,  alt(A;B), s(S). 

% transitive
:-  A < B, wel(S,A,B), wel(S,B,C), wel(S,C,A). 

% unanimity
:-  rank(S,V,A,B) : voter(V), wel(S,B,A). 

% non-dictatorial
diff(V) :- s(S), wel(S,A,B), rank(S,V,B,A). 

:- voter(V), not diff(V). 

% independent of irrelevant alternatives
relevant(S1,S2,V,A,B) :- 
    A < B,
    rank(S1,V,A,B), 
    rank(S2,V,B,A). 

:-  not relevant(S1,S2,V,A,B) : voter(V), wel(S1,A,B), wel(S2,B,A), A < B. 
