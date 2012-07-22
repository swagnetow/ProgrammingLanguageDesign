age(apolinario, 86).
age(pamfila, 74).
age(apolinar, 53).
age(marissa, 48).
age(jp, 25).
age(jake, 22).
age(jen, 14).

family([apolinario, pamfila, [apolinar]]).
family([apolinar, marissa, [jp, jake, jen]]).

member1([HEAD|_], HEAD). 
member1([_|TAIL], OLD) :- member1(TAIL, OLD).

children(CHILDREN, [_, _, CHILDREN]). 

parent(PARENT, CHILD):- family(LIST),
                        children(CHILDREN, LIST),
                        member1(LIST, PARENT),
                        member1(CHILDREN, CHILD),
                        CHILD \= PARENT. 

maxList([HEAD], HEAD). 
maxList([HEAD|TAIL], MAX):- maxList(TAIL, MAX1),
                            (HEAD >= MAX1,
                            MAX = HEAD;
                            HEAD < MAX1,
                            MAX = MAX1). 

oldestChild(CHILD, AGE) :- family(LIST),
                           children(CHILDREN, LIST),
                           findall(AGE, (member1(CHILDREN, CHILD), age(CHILD, AGE)), OLDEST),
                           maxList(OLDEST, AGE),
                           age(CHILD, AGE). 

oldestGrandchild(CHILD, GRANDPARENT) :- oldestChild(CHILD, _),
                                        parent(GRANDPARENT, PARENT),
                                        parent(PARENT, CHILD).
