#const n=4 .
#hide. 
#show contains/2. 

alternative(1..n). 

{ contains(num, N) } :- alternative(N). 
