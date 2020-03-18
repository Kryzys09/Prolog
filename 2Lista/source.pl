add(a, X, X).
add(s(X), Y, s(Z)) :-
    add(X, Y, Z).

member(X, [X | _]).
member(X, [_ | L]) :-
    member(X, L).

append([], L, L).
append([X | L1], L2, [X | L3]) :-
    append(L1, L2, L3).

select(X, [X | L], L).
select(X, [Y | L1], [Y | L2]) :-
    select(X, L1, L2).

same_length([], []).
same_length([_ | L1], [_ | L2]) :-
    same_length(L1, L2).

no_last_element([], [_]).
no_last_element([X | L1], [X | L2]) :-
    no_last_element(L1, L2).

środkowy(X, [X]).
środkowy(X, [_ | L1]) :-
    no_last_element(L, L1),
    środkowy(X, L).

jednokrotnie(X, [X]).
jednokrotnie(X, [Y | L]) :-
    (X = Y, \+ member(X, L));
    (member(X, L), X \= Y, jednokrotnie(X, L)).

dwukrotnie(X, [Y | L]) :-
    (X = Y, jednokrotnie(X, L));
    (member(X, L), X \= Y, dwukrotnie(X, L)).

arc(a, b).
arc(b, a).
arc(b, c).
arc(c, d).

osiągalny_P(X, Y, V) :-
    (\+ member(X, V)),
    (
     X = Y;
     arc(X, Y);
     (arc(X, Z), osiągalny_P(Z, Y, [X | V]))
    ).

osiągalny(X, Y) :-
    osiągalny_P(X, Y, []).

% lista() spełnia specyfikację podaną w zadaniu, aczkolwiek wyświetla więcej rozwiązań niż
% można by się spodziewać, jako że opisana specyfikacja ma więcej możliwości niż przedstawiony scenariusz
% z krzywą zamkniętą


połącz([], [], []).
połącz([H1|T1], [H2|T2], [H1,H2|T]) :-
    połącz(T1, T2, T).

lista(N, X) :-
    numlist(1, N, L1),
    permutation(L1, L2),
    permutation(L1, L3),
    połącz(L2, L3, X).
