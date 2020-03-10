left_of(bike, camera).
left_of(pencil, hourglass).
left_of(hourglass, butterfly).
left_of(butterfly, fish).
left_of(X, Y) :-
    X \= Y,
    left_of(X, Z),
    left_of(Z, Y).

above(bike, pencil).
above(camera, butterfly).
above(X, Y) :-
    X \= Y,
    above(X, Z),
    above(Z, Y).

right_of(X, Y) :-
    left_of(Y, X).

below(X, Y) :-
    above(Y, X).

higher(X, Y) :-
    X \= Y,
    above(X, Z),
    (
        left_of(Z, Y);
        left_of(Y, Z);
        Y = Z
    ).

