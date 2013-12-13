#!/bin/zsh 

gringo dom_size_3.lp --const n=31 | clasp  --configuration=chatty -t 7 --stat > out.txt
