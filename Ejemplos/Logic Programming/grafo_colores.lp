nodo(a).
nodo(b).
nodo(c).
nodo(d).

arco(a,b,azul).
arco(b,c,verde).
arco(b,d,azul).
arco(a,b,verde).

% alcanzable_color(X,Y,C) es verdadero si hay un camino entre X e Y
% compuesto por aristas de color C

alcanzable_color(X,Y,C) :- arco(X,Y,C).
alcanzable_color(X,Y,C) :- arco(X,Z,C),alcanzable_color(Z,Y,C).
