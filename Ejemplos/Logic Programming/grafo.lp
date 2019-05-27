nodo(a).
nodo(b).
nodo(c).
nodo(d).

arco(a,b).
arco(b,c).
arco(c,a).
arco(b,d).

alcanzable(X,Y) :- arco(X,Y).
alcanzable(X,Y) :- arco(X,Z),alcanzable(Z,Y).
