#hide. 
#show rank/4. 
#show wel/3. 

alt(A) :- rank(_,_,A,_). 
alt(B) :- rank(_,_,_,B). 
voter(V) :- rank(_,V,_,_). 
s(S) :- rank(S,_,_,_). 

{ wel(S,A,B) } :- A != B, alt(A;B), s(S). 

% complete
:-  s(S), alt(A;B), A != B, not wel(S,A,B), not wel(S,B,A).

% irreflexive
:-  s(S), wel(S,A,B), wel(S,B,A). 

% transitive
:-  s(S), A != C, wel(S,A,B), wel(S,B,C), not wel(S,A,C). 

% unanimity
:-  s(S), alt(A;B), rank(S,V,A,B) : voter(V), not wel(S,A,B). 

% non-dictatorial
diff(V) :- s(S), wel(S,A,B), rank(S,V,B,A). 

:- voter(V), not diff(V). 

% independent of irrelevant alternatives
relevant(S1,S2,V,A,B) :- 
    A < B, S1 != S2, 
    rank(S1,V,A,B), 
    rank(S2,V,B,A). 

:-  not relevant(S1,S2,V,A,B) : voter(V), wel(S1,A,B), wel(S2,B,A), A < B. 
