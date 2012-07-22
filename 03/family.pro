% Male family members.
is_male(male_name_goes_here).

% Female family members.
is_female(female_name_goes_here).

% Family members that are parents of children.
is_parent_of(parent_name_goes_here, child_name_goes_here).

mother(MOTHER, CHILD) :- is_female(MOTHER),
                         is_parent_of(MOTHER, CHILD).
father(FATHER, CHILD) :- is_male(FATHER),
                         is_parent_of(FATHER, CHILD).

sibling1(NAME1, NAME2) :- is_parent_of(FATHER, NAME1),
                          is_parent_of(FATHER, NAME2),
                          NAME1 \= NAME2.
brother1(NAME1, NAME2) :- is_male(NAME1),
                          is_parent_of(FATHER, NAME1),
                          is_male(NAME2),
                          is_parent_of(FATHER, NAME2),
                          NAME1 \= NAME2;
                          is_male(NAME1),
                          is_parent_of(MOTHER, NAME1),
                          is_male(NAME2),
                          is_parent_of(MOTHER, NAME2),
                          NAME1 \= NAME2.
sister1(NAME1, NAME2) :- is_female(NAME1),
                         is_parent_of(FATHER, NAME1),
                         is_female(NAME2),
                         is_parent_of(FATHER, NAME2),
                         NAME1 \= NAME2;
                         is_female(NAME1),
                         is_parent_of(MOTHER, NAME1),
                         is_female(NAME2),
                         is_parent_of(MOTHER, NAME2),
                         NAME1 \= NAME2.
sibling2(NAME1, NAME2) :- is_parent_of(FATHER, NAME1),
                          is_parent_of(FATHER, NAME2),
                          is_parent_of(MOTHER, NAME1),
                          is_parent_of(MOTHER, NAME2),
                          NAME1 \= NAME2.
brother2(NAME1, NAME2) :- is_male(NAME1),
                          is_parent_of(FATHER, NAME1),
                          is_male(NAME2),
                          is_parent_of(FATHER, NAME2),
                          NAME1 \= NAME2;
                          is_male(NAME1),
                          is_parent_of(MOTHER, NAME1),
                          is_male(NAME2),
                          is_parent_of(MOTHER, NAME2),
                          NAME1 \= NAME2.
sister2(NAME1, NAME2) :- is_female(NAME1),
                         is_parent_of(FATHER, NAME1),
                         is_female(NAME2),
                         is_parent_of(FATHER, NAME2),
                         NAME1 \= NAME2;
                         is_female(NAME1),
                         is_parent_of(MOTHER, NAME1),
                         is_female(NAME2),
                         is_parent_of(MOTHER, NAME2),
                         NAME1 \= NAME2.

cousin(NAME1, NAME2) :- sibling1(SIBLING1, SIBLING2),
                        is_parent_of(SIBLING1, NAME1),
                        is_parent_of(SIBLING2, NAME2).
uncle(UNCLE, CHILDNAME) :- is_male(UNCLE),
                           is_parent_of(UNCLE, COUSIN),
                           cousin(COUSIN, CHILDNAME).
aunt(AUNT, CHILDNAME) :-  is_female(AUNT),
                          is_parent_of(AUNT, COUSIN),
                          cousin(COUSIN, CHILDNAME).
grandparent(GRANDPARENT, GRANDCHILD) :- is_parent_of(GRANDPARENT, PARENT),
                                        is_parent_of(PARENT, GRANDCHILD).
grandmother(GRANDMOTHER, GRANDCHILD) :- is_female(GRANDMOTHER),
                                        grandparent(GRANDMOTHER, GRANDCHILD).
grandfather(GRANDFATHER, GRANDCHILD) :- is_male(GRANDFATHER),
                                        grandparent(GRANDFATHER, GRANDCHILD).
grandchild(GRANDCHILD, GRANDPARENT) :- father(FATHER, GRANDCHILD),
                                       is_parent_of(GRANDPARENT, FATHER);
                                       mother(MOTHER, GRANDCHILD),
                                       is_parent_of(GRANDPARENT, MOTHER).

greatgrandparent(GREATGRANDPARENT, GREATGRANDCHILD) :- is_parent_of(GREATGRANDPARENT, GRANDPARENT),
                                                       grandparent(GRANDPARENT, GREATGRANDCHILD).

ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(ANCESTOR, CHILDNAME).
ancestor(ANCESTOR, CHILDNAME) :- is_parent_of(PARENT, CHILDNAME),
                                 is_parent_of(ANCESTOR, PARENT).
