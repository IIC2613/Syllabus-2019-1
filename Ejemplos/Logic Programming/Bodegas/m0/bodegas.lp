#const bound = 7.
time(1..bound).

% hay 5 acciones posibles
action(up).
action(down).
action(left).
action(right).
action(wait).

%exec(R,A,T) significa que R ejecuta la accion A en T

%R está en (X,Y) en tiempo T si es que R está en Xp,Yp en T-1 y
%ejecutas A y X,Y se obtiene del delta
on(R,X-1,Y,T) :- exec(R,left,T-1),on(R,X,Y,T-1),time(T).
on(R,X+1,Y,T) :- exec(R,right,T-1),on(R,X,Y,T-1),time(T).
on(R,X,Y+1,T) :- exec(R,up,T-1),on(R,X,Y,T-1),time(T).
on(R,X,Y-1,T) :- exec(R,down,T-1),on(R,X,Y,T-1),time(T).
on(R,X,Y,T) :- exec(R,wait,T-1),on(R,X,Y,T-1),time(T).

1{exec(R,A,T-1) : action(A)} 1 :- robot(R),time(T).
:- on(R,X,Y,T),on(Rp,X,Y,T),R!=Rp.
:- on(R,X,Y,T),obstacle(X,Y).
:- on(R,X,Y,T),not rangeX(X).
:- on(R,X,Y,T),not rangeY(Y).

:- not on(1,0,7,7).

#show on/4.
#show obstacle/2.
#show rangeX/1.
#show rangeY/1.
#show exec/3.
#show goal/3.

%%%%% Definición del problema

% entre que valores se mueven X e Y
rangeX(0..6).
rangeY(0..7).

obstacle(1,1..6).
obstacle(3,1..6).
obstacle(5,1..6).

robot(1..4).
on(1,0,3,0).
on(2,2,0,0).
on(3,4,0,0).
on(4,6,0,0).

% goal(R,X,Y): el robot R debe llegar a X,Y
goal(1,0,7).
goal(2,2,7).
goal(3,4,7).
goal(4,6,7).
