color(azul).
color(verde).
color(amarillo).

caja(a).
caja(b).
caja(c).
caja(d).

% la primera regla está pidiendo que es_de_color(J,C) sea verdadero para un par caja,alcanzable_color_unico
%1 {es_de_color(J,C):color(C),caja(J)} 1.

% está pidiendo que se asig ne un color a cada caja.
1 {es_de_color(J,C):color(C)} 1 :- caja(J).
%1 {es_de_color(a,C):color(C)} 1.
%1 {es_de_color(b,C):color(C)} 1.
