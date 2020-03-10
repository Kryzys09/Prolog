le(b, b).
le(c, c).
le(d, d).
le(e, e).

le(c, e).
le(d, e).
le(b, c).
le(b, d).

le(b, e).

zbiór(X) :- le(X,_).
zbiór(X) :- le(_,X).

dla_każdego(X, Y) :- \+ (X, \+ Y).

lt(X, Y) :-
    le(X, Y),
    X \= Y.

maksymalny(X) :-
    zbiór(X),
    \+ lt(X, Y).

minimalny(X) :-
    zbiór(X),
    \+ lt(Y, X).

największy(X) :-
    zbiór(X),
    dla_każdego(zbiór(Y), le(Y, X)).

najmniejszy(X) :-
    zbiór(X),
    dla_każdego(zbiór(Y), le(X, Y)).
