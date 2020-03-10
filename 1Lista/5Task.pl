le(1, 1).
le(2, 2).
le(3, 3).
le(4, 4).
le(5, 5).
le(6, 6).
le(7, 7).
le(1, 2).
le(1, 3).
le(1, 4).
le(1, 5).
le(1, 6).
le(2, 3).
le(2, 4).
le(2, 5).
le(2, 6).
le(3, 4).
le(3, 5).
le(3, 6).
le(3, 7).
le(4, 7).
le(5, 6).
le(5, 7).
le(6, 7).

zbiór(X) :- le(X,_).
zbiór(X) :- le(_,X).

dla_każdego(X, Y) :- \+ (X, \+ Y).

zwrotny :-
    dla_każdego(zbiór(X), le(X, X)).

przechodni :-
    dla_każdego(
        (zbiór(X), zbiór(Y), zbiór(Z), le(X, Y), le(Y, Z)),
        le(X, Z)
    ).

słabo_antysymetryczny :-
    dla_każdego(
        (zbiór(X), zbiór(Y), le(X, Y), le(Y, X)),
        X = Y
    ).

częściowy_porządek :-
    zwrotny,
    przechodni,
    słabo_antysymetryczny.
