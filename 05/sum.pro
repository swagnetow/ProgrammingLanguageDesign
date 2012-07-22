sum([HEAD], HEAD).  
sum(LIST, SUM) :- min(LIST, MIN),
                  max(LIST, MAX),
                  SUM is MIN + MAX.

min([HEAD], HEAD). 
min([HEAD, PART|TAIL], MIN):- HEAD =< PART,
                              min([HEAD|TAIL], MIN). 
min([HEAD, PART|TAIL], MIN):- HEAD > PART,
                              min([PART|TAIL], MIN). 

max([HEAD], HEAD). 
max([HEAD, PART|TAIL], MAX):- HEAD >= PART,
                              max([HEAD|TAIL], MAX). 
max([HEAD, PART|TAIL], MAX):- HEAD < PART,
                              max([PART|TAIL], MAX).  
