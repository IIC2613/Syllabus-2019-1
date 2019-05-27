pasto_mojado :- llueve.  % llueve implica pasto_mojado
pasto_mojado :- riego.   % riego implica pasto_mojado

riego.


p :- q.
q :- r.
q :- s.
s.


t :- u.
u :- y,k.
y :- x.
x.
u.

nodo(a).
nodo(b).
nodo(c).
nodo(d).
nodo(e).

arco(a,b).
arco(b,c).
arco(b,d).
arco(d,e).

misterio(X,Y) :- arco(X,Z),arco(Z,Y).
