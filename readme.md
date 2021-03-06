A repository for encodings of theorems and problems in social choice and game theory
====================================================================================


Initial ideas are taken from 


* [1] P. Tang, F. Lin: Computer-aided proofs of Arrow's and other impossibility theorems. Artif. Intell.  173(11): 1041-1053 (2009)
* [2] C. Geist, Ulrich Endriss: Automated Search for Impossibility Theorems in Social Choice Theory: Ranking Sets of Objects.  J. Artif. Intell. Res. (JAIR) 40: 143-174 (2011)

Current Results
----------------

We are able to reproduce the result of [1] by formulating the problem in ASP, see arrow.lp. 

Our tests are as follows. We are able to ground the formula for cases (2,3), (2,4) and (3,3), voters and alternatives
respectively (see results_ARROW.txt for details). We observe that the problems are not real SAT problems, as the solver
hardly does any search (1-2 decisions), the rest is done by unit propagation. 

As a test we removed the non-dictatorial axiom and the solver find exactly the solutions where one of the voter is a
dictator, see result_DICTATOR.txt.

The case (3,4) is not groundable any more and the double exponential encoding does not suffice for such cases. 

Interestingly, in the paper [1] they report for case (2,3) the number of variables to be 35973 and clauses 106354, whereas we need 9548
variables and 12193 clauses. 

Explanation of files and usage
----------------

* arrow.lp: encoding of arrows impossibility theorem
* prefs.sh: encoding to generate all preference relations for a set of voters and alternatives
* make_prefs.sh: generates to stdout the ranking specified in prefs.lp
* prefs-<vot>-<alt>.lp: grounded preferences for sets of voters and alternatives

    To generate the result, install clasp and gringo from [potassco](http://potassco.sourceforge.net/) and e.g. run

```
gringo prefs-2-3.lp arrow.lp | clasp 0 -q --stat
```
