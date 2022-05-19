%es_aeronave: aeronave
es_aeronave(cessna).
es_aeronave(ceechcraft).
es_aeronave(embraer_phenom).
es_aeronave(boing717).
es_aeronave(embraer190).
es_aeronave(airBusA220).
es_aeronave(boing747).
es_aeronave(airBusA340).
es_aeronave(airBusA380).

%es_pista(p1).
%es_pista(p2EO).
%es_pista(p2OE).
%es_pista(p3).

%pista_para: pista, tamnio de aeronave que la usa
pista_para(p1, pequenio).
pista_para(p2_1, mediano).
pista_para(p2_2, mediano).
pista_para(p3, grande).

direccion(p2_1, eo).
direccion(p2_2, oe).

% pistas_ocupada(p1).
ocupada(r).

%tamanio: aeronave, tamanio
tamanio(cessna, pequenio).
tamanio(beechcraft, pequenio).
tamanio(embraer_phenom, pequenio).
tamanio(boing717, mediano).
tamanio(embraer190, mediano).
tamanio(airBusA220, mediano).
tamanio(boing747, grande).
tamanio(airBusA340, grande).
tamanio(airBusA380, grande).

nivel_de_tamanio(pequenio, 1).
nivel_de_tamanio(mediano, 2).
nivel_de_tamanio(grande, 3).

%es emergencia: situacion
es_emergencia(secuestro).
es_emergencia(error_en_motor).
es_emergencia(problema_de_salud).
es_emergencia(parto).

%atiende_emergecia: personal
atiende_emergencia(bomberos).
atiende_emergencia(medico).
atiende_emergencia(oij).
atiende_emergencia(gerente_de_aerolinea).

%orden: usar_pista: aeronave, pista
usar_pista(X,Y):-
    es_aeronave(X),tamanio(X,Z),pista_para(Y,W),
    nivel_de_tamanio(Z,M), nivel_de_tamanio(W,N),N>=M.
    ocupada(Y).

% verificar_direccion(X,Y):-

%Intento de mierda
% ocupar(Y,Z):-
%     pista_para(Y,_),
%     pistas_ocupadas(X),
%     append([Y],X,Z).



%mayday(X,Y):-
%    es_aeronave(X),tamanio(X,Z),pista_para(Y,Z).
