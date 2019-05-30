regador(r1).
regador(r2).
regador(r3).
regador(r4).

planta(espinaca).
planta(tomate).
planta(oregano).

riega(r1,espinaca).
riega(r2,tomate).
riega(r3,tomate).
riega(r4,oregano).

encendido(r4).

1{encendido(R):regador(R)} 1.

:- not regada(oregano).
:- not regada(tomate).

regada(P) :- encendido(R), planta(P),regador(R), riega(R,P).
