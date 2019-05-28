nodo(a).
nodo(b).
nodo(c).
nodo(d).

% arco_nd(X,Y) cuando hay un arco no dirigido entre X e Y.

arco_nd(a,b).
arco_nd(a,c).
arco_nd(c,b).
arco_nd(b,c).

unidos(X,Y) :- arco_nd(X,Y).
unidos(X,Y) :- arco_nd(Y,X).


% clique es verdadero si el grafo es un clique
desunion(X,Y) :- nodo(X),nodo(Y),X!=Y, not unidos(X,Y).
desunion :- nodo(X),nodo(Y), X!=Y, not unidos(X,Y).

clique :- not desunion.
