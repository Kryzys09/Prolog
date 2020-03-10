le(c, e).
le(d, e).
le(c, c).
le(d, d).
le(e, e).

zbiór(X) :- le(X,_).
zbiór(X) :- le(_,X).

zwrotny :-
    zbiór(X),
    le(X, X).

przechodni :-
    true.

słabo_antysymetryczny :-
    true.

częściowy_porzadek :-
    zwrotny,
    przechodni,
    słabo_antysymetryczny.
