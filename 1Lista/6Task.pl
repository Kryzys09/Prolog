isPrime(X) :-
    Z is floor(sqrt(X)),
    forall(between(2, Z, Y), (X mod Y =\= 0)).
    
prime(LO, HI, N) :-
    between(LO, HI, N),
    isPrime(N).
