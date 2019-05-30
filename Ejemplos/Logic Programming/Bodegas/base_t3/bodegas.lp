#const bound = 14.
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
on(R,X-1,Y,T) :- exec(R,left,T-1),on(R,X,Y,T-1),time(T),rangeX(X),rangeY(Y).
on(R,X+1,Y,T) :- exec(R,right,T-1),on(R,X,Y,T-1),time(T),rangeX(X),rangeY(Y).
on(R,X,Y+1,T) :- exec(R,up,T-1),on(R,X,Y,T-1),time(T),rangeX(X),rangeY(Y).
on(R,X,Y-1,T) :- exec(R,down,T-1),on(R,X,Y,T-1),time(T),rangeX(X),rangeY(Y).
on(R,X,Y,T)   :- exec(R,wait,T-1),on(R,X,Y,T-1),time(T),rangeX(X),rangeY(Y).

% Cada robot ejecuta una acción en cada instante de tiempo en 0..bound-1
1 {exec(R,A,T-1) : action(A)} 1 :- robot(R),time(T).

% no hay dos robots en la misma ubicación
:- on(R,X,Y,T),on(Rp,X,Y,T),R!=Rp.

% no hay un robot sobre un obstáculo
:- on(R,X,Y,T),obstacle(X,Y).

% no hay robots fuera de la grilla
:- on(R,X,Y,T),not rangeX(X).
:- on(R,X,Y,T),not rangeY(Y).


% dos robots no se pueden 'intercambiar'
:- on(R1,X1+1,Y1,T-1), on(R2,X1,Y1,T-1), on(R1,X1,Y1,T), on(R2,X1+1,Y1,T).
:- on(R1,X1,Y1+1,T-1), on(R2,X1,Y1,T-1), on(R1,X1,Y1,T), on(R2,X1,Y1+1,T).

% goal_achieved(R,T): robot R está en su objetivo en el tiempo T
goal_achieved(R,T) :- on(R,X,Y,T),goal(R,X,Y).

% pedimos que todo robot haya llegado al objetivo
:- robot(R),not goal_achieved(R,bound).


% los siguientes predicados es necesario mostrarlos para el visualizador
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

%% obstacle(X,Y): celda (X,Y) es un obstáculo
obstacle(1,1..6).
obstacle(3,1..6).
obstacle(5,1..6).

%% definimos los robots
robot(1..12).

% la posición inicial (tiempo 0) de cada robot
on(1,0,0,0).
on(2,2,0,0).
on(3,4,0,0).
on(4,6,0,0).
on(5,0,7,0).
on(6,2,7,0).
on(7,4,7,0).
on(8,6,7,0).
on(9,0,3,0).
on(10,0,4,0).
on(11,6,3,0).
on(12,6,4,0).

% goal(R,X,Y): el robot R debe llegar a (X,Y)
goal(1,0,7).
goal(2,2,7).
goal(3,4,7).
goal(4,6,7).
goal(5,0,0).
goal(6,2,0).
goal(7,4,0).
goal(8,6,0).
goal(9,6,3).
goal(10,6,4).
goal(11,0,3).
goal(12,0,4).
