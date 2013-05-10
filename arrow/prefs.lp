#hide. 
#show rank/4. 

alt(a1;a2;a3). 
%alt(a1;a2;a3;a4). 
voter(v1;v2;v3). 
%voter(v1;v2). 

{ rank(num,V,A1,A2) : A1 != A2 : alt(A1;A2) } :- voter(V). 

% complete
:- alt(A1;A2), A1 != A2, voter(V), not rank(num,V,A1,A2), not rank(num,V,A2,A1).

%% irreflexive
:- rank(num,V,A1,A2), rank(num,V,A2,A1). 

% transitive
:- A1 != A3, rank(num,V,A1,A2), rank(num,V,A2,A3), not rank(num,V,A1,A3). 
