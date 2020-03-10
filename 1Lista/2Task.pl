on(a, b).
on(b, c).
on(c, d).
on(d, e).

above(X, Y) :-
    X \= Y,
    (
        on(X, Y);
        (on(X, Z), above(Z, Y))
    ).

