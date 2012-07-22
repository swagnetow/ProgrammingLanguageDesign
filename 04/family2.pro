m([male1, male2]).
f([female1, female2]).
family(parent1, parent2, [child1, child2]).

male(MALE) :- m(LIST),
              member(MALE, LIST).
female(FEMALE) :- f(LIST),
                  member(FEMALE, LIST).
father(FATHER, CHILD) :- family(FATHER, _, LIST),
                         member(CHILD, LIST).
mother(MOTHER, CHILD) :- family(_, MOTHER, LIST),
                         member(CHILD, LIST).
parent(PARENT, CHILD) :- father(PARENT, CHILD);
                         mother(PARENT, CHILD).
siblings1(NAME1, NAME2) :- father(_, NAME1),
                           father(_, NAME2),
                           family(_, _, LIST),
                           member(NAME1, LIST),
                           member(NAME2, LIST),
                           NAME1 \= NAME2.
siblings2(NAME1, NAME2) :- father(FATHER, NAME1),
                           father(FATHER, NAME2),
                           mother(MOTHER, NAME1),
                           mother(MOTHER, NAME2),
                           family(FATHER, MOTHER, LIST),
                           member(NAME1, LIST),
                           member(NAME2, LIST),
                           NAME1 \= NAME2.
brother1(NAME1, NAME2) :- m(LIST),
                          member(NAME1, LIST),
                          member(NAME2, LIST),
                          father(_, NAME1),
                          father(_, NAME2),
                          family(_, _, FAMILY),
                          member(NAME1, FAMILY),
                          member(NAME2, FAMILY),
                          NAME1 \= NAME2.
brother2(NAME1, NAME2) :- m(LIST),
                          member(NAME1, LIST),
                          member(NAME2, LIST),
                          father(_, NAME1),
                          father(_, NAME2),
                          mother(_, NAME1),
                          mother(_, NAME2),
                          family(_, _, FAMILY),
                          member(NAME1, FAMILY),
                          member(NAME2, FAMILY),
                          NAME1 \= NAME2.
sister1(NAME1, NAME2) :- f(LIST),
                         member(NAME1, LIST),
                         member(NAME2, LIST),
                         father(_, NAME1),
                         father(_, NAME2),
                         family(_, _, FAMILY),
                         member(NAME1, FAMILY),
                         member(NAME2, FAMILY),
                         NAME1 \= NAME2.
sister2(NAME1, NAME2) :- f(LIST),
                         member(NAME1, LIST),
                         member(NAME2, LIST),
                         father(_, NAME1),
                         father(_, NAME2),
                         mother(_, NAME1),
                         mother(_, NAME2),
                         family(_, _, FAMILY),
                         member(NAME1, FAMILY),
                         member(NAME2, FAMILY),
                         NAME1 \= NAME2.
cousins(NAME1, NAME2) :- siblings2(PARENT1, PARENT2),
                         parent(PARENT1, NAME1),
                         parent(PARENT2, NAME2),
                         NAME1 \= NAME2.
uncle(UNCLE, CHILDNAME) :- m(MALES),
                           member(UNCLE, MALES),
                           family(UNCLE, _, COUSINS),
                           member(COUSIN, COUSINS),
                           cousins(CHILDNAME, COUSIN).
aunt(AUNT, CHILDNAME) :- f(FEMALES),
                         member(AUNT, FEMALES),
                         family(_, AUNT, COUSINS),
                         member(COUSIN, COUSINS),
                         cousins(CHILDNAME, COUSIN).
grandchild(GRANDCHILD, GRANDPARENT) :- parent(FATHER, GRANDCHILD),
                                       parent(GRANDPARENT, FATHER).
grandson(GRANDSON, GRANDPARENT) :- parent(PARENT, GRANDSON),
                                   parent(GRANDPARENT, PARENT).
granddaughter(GRANDDAUGHTER, GRANDPARENT) :- parent(PARENT, GRANDDAUGHTER),
                                             parent(GRANDPARENT, PARENT).
greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- grandchild(GREATGRANDCHILD, GRANDPARENT),
                                                       parent(GREATGRANDPARENT, GRANDPARENT).
ancestor(ANCESTOR, CHILDNAME) :- parent(ANCESTOR, CHILDNAME).
ancestor(ANCESTOR, CHILDNAME) :- parent(PARENT, CHILDNAME),
                                 parent(ANCESTOR, PARENT).
