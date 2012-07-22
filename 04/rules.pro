% Membership testing
isMember(X, [X|_]).
isMember(X, [_|T]) :- isMember(X, T).

% First element
firstElement(H, [H|_]).

% Last element
lastElement(X, [X]).
lastElement(X, [_|T]) :- lastElement(X, T).

% Two adjacent elements in a list
twoAdjacent(X, Y, [X,Y|_]).
twoAdjacent(X, Y, [_|T]) :- twoAdjacent(X, Y, T).

% Three adjacent elements in a list
threeAdjacent(X, Y, Z, [X,Y,Z|_]).
threeAdjacent(X, Y, Z, [_|T]) :- threeAdjacent(X, Y, Z, T).

% Append list1 to list2 producing list3
appendTo([], L, L).
appendTo([X|T1], L2, [X|T3]) :- appendTo(T1, L2, T3).

% Delete element from a list
del(X, [X|T], T).
del(X, [H|T], [H|T1]) :- del(X, T, T1).

% Insert element in a list
insert(X, L, XL) :- del(X, XL, L).

% Compute the length of list
lengthOf([], 0).
lengthOf([_|T], N) :- lengthOf(T, N1),
                      N is 1 + N1.

% Reverse a list
reverseList([], []).
reverseList([H|T], REVERSE) :- reverseList(T, TREVERSE),
                               append(TREVERSE, [H], REVERSE).

% Check whether a list is a palindrome
palindrome(LIST, RLIST) :- reverseList(LIST, RLIST),
                           LIST = RLIST.

% Display a list
displayList([]).
displayList([H|T]) :- write(H),
                      tab(1),
                      displayList(T).
