%#hide. 
%#show result/5. 

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

% unaminity
:-  s(S), alt(A;B), rank(S,V,A,B) : voter(V), not wel(S,A,B). 

%%% dictator
%diff(V) :- s(S), wel(S,A,B), rank(S,V,B,A). 
%
%:- voter(V), not diff(V). 

% independent of irrelevant alternatives
indiff(S1,S2,V,A,B) :- 
    alt(A;B), 
    S1 != S2, 
    rank(S1,V,A,B), 
    rank(S2,V,A,B). 

indiff(S1,S2,V,A,B) :- 
    alt(A;B), 
    A != B,
    s(S1;S2),
    S1 != S2, 
    voter(V), 
    not rank(S1,V,A,B), 
    not rank(S2,V,A,B). 

same(S1,S2,A,B) :- 
    alt(A;B), 
    s(S1;S2),
    S1 != S2, 
    indiff(S1,S2,V,A,B) : voter(V). 

:-  same(S1,S2,A,B), wel(S1,A,B), not wel(S2,A,B). 
