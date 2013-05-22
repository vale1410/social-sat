#const n=8.
#hide. 
#show contains/2. 

alternative(1..n). 

{ contains(num, N) } :- alternative(N). 
