nodo(a).
nodo(b).
nodo(c).
nodo(d).

arco(a,b,azul).
arco(b,c,verde).
arco(b,d,azul).
arco(a,b,verde).

color(azul).
color(verde).

% alcanzable_color(X,Y,C) es verdadero si hay un camino entre X e Y
% compuesto por aristas de color C

alcanzable_color(X,Y,C) :- arco(X,Y,C).
alcanzable_color(X,Y,C) :- arco(X,Z,C),alcanzable_color(Z,Y,C).

% alcanzable_color_unico(X,Y,C) Y es alcanzable desde X por un
% camino de color C y no por un camino de otro color
alcanzable_color_unico(X,Y,C) :- alcanzable_color(X,Y,C), not alcanzable_otro_color(X,Y,C).

% alcanzable_otro_color(X,Y,C) Y es alcanzable desde X a traves de un camino
% que tiene un color distinto a C.
alcanzable_otro_color(X,Y,C) :- alcanzable_color(X,Y,Cp),color(C),color(Cp),Cp!=C.

#show alcanzable_color_unico/3.
