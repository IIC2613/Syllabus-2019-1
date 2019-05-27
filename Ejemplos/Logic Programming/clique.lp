nodo(a).
nodo(b).
nodo(c).
nodo(d).

% arco(X,Y) cuando hay un arco no dirigido entre X e Y.

arco_nd(a,b).
arco_nd(a,d).
arco_nd(c,d).

arco(X,Y) :- arco_nd(X,Y).
arco(X,Y) :- arco_nd(Y,X).
