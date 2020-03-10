kobieta(janina).
kobieta(kasia).
kobieta(asia).
kobieta(zosia).
kobieta(kalina).
kobieta(marylka).
mężczyzna(kostek).
mężczyzna(krzysztof).
mężczyzna(maciek).
mężczyzna(hubert).
mężczyzna(karol).
mężczyzna(krzyś).
mężczyzna(wojtek).
mężczyzna(michał).
mężczyzna(witek).
matka(janina, kasia).
matka(janina, maciek).
matka(janina, zosia).
matka(kasia, kalina).
matka(kasia, michał).
matka(asia, karol).
matka(asia, krzyś).
matka(asia, wojtek).
matka(zosia, marylka).
matka(zosia, witek).
ojciec(kostek, kasia).
ojciec(kostek, maciek).
ojciec(kostek, zosia).
ojciec(krzysztof, kalina).
ojciec(krzysztof, michał).
ojciec(maciek, karol).
ojciec(maciek, krzyś).
ojciec(maciek, wojtek).
ojciec(hubert, marylka).
ojciec(hubert, witek).

rodzic(X, Y) :-
    matka(X, Y);
    ojciec(X, Y).

jest_matką(X) :-
    matka(X, Y).

jest_ojcem(X) :-
    ojciec(X, Y).

jest_synem(X) :-
    mężczyzna(X),
    (ojciec(Y, X); matka(Y, X)).

dziadek(X, Y) :-
    ojciec(X, Z), ojciec(Z, Y).

dziadek(X, Y) :-
    ojciec(X, Z), matka(Z, Y).

rodzeństwo(X, Y) :-
    X \= Y,
    ((ojciec(Z, X), ojciec(Z, Y)); (matka(Z, X), matka(Z, Y))).

siostra(X, Y) :-
    kobieta(X),
    rodzeństwo(X, Y).
