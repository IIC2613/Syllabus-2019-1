%% -- PROBLEMA 1 --
% Hace todo bien
%% Con una única solución de 5 () pasos

% R O D
% X O X
% P O P
% D O R

#show exec/3.

#const bound = 5.
time(1..bound).

% Mapa de 3x4
rangeX(0..2).
rangeY(0..3).

% Obstáculo en toda al columna central
obstacle(1,0..3).

% 2 robot en esquina superior izquierda
% y esquina inferior derecha
robot(1..2).
on(1,0,3,0).
on(2,2,0,0).

% 2 productos a lo largo
% de la primera y tercera columna
product(1).
product(2).
at(1,0,1,0).
%at(2,0,2,0).
at(2,2,1,0).
%at(4,2,2,0).

% Entrega de los productos de la izquierda
delivery_station(1,0,0).
%delivery_station(2,0,0).
% Entre de los productos de la derecha
delivery_station(2,2,3).
%delivery_station(4,2,3).

%% -- PROBLEMA 2 --
%% No puede llevar más de 3 objetos
%% Sin solución

% R
% P
% P
% P
% P
% D

#const bound = 14.
time(1..bound).

% Mapa de 1x6
rangeX(0).
rangeY(0..5).

% 1 robot abajo
robot(1).
on(1,0,0,0).

% 4 productos en el pasillo
product(1..4).
at(1,0,1,0).
at(2,0,2,0).
at(3,0,3,0).
at(4,0,4,0).

% Lugar de entrega
delivery_station(1,0,5).
delivery_station(2,0,5).
delivery_station(3,0,5).
delivery_station(4,0,5).

%% -- PROBLEMA 3 --
%% No puede llevar más de 3 y se devuelve a buscarlo
%% Con solución

% R
% P
% P
% P
% P
% D

#const bound = 15.
time(1..bound).

% Mapa de 1x6
rangeX(0).
rangeY(0..5).

% 1 robot abajo
robot(1).
on(1,0,0,0).

% 4 productos en el pasillo
product(1..4).
at(1,0,1,0).
at(2,0,2,0).
at(3,0,3,0).
at(4,0,4,0).

% Lugar de entrega
delivery_station(1,0,5).
delivery_station(2,0,5).
delivery_station(3,0,5).
delivery_station(4,0,5).


%% -- PROBLEMA 4 --
%% Debe estár en la posición del
%% objeto para hacer pick
%% Sin solución

% R
% O
% P
% D

#const bound = 10.
time(1..bound).

% Mapa de 1x4
rangeX(0).
rangeY(0..3).

% 1 robot arriba
robot(1).
on(1,0,3,0).

% 1 obstáculo al medio
obstacle(0,2).

% 1 producto
product(1).
at(1,0,1,0).

% Lugar de entrega
delivery_station(1,0,0).
