:- dynamic(ocupada/1).
ocupada().

%es_aeronave: aeronave
% es_aeronave(cessna).
% es_aeronave(ceechcraft).
% es_aeronave(embraer_phenom).
% es_aeronave(boing717).
% es_aeronave(embraer190).
% es_aeronave(airBusA220).
% es_aeronave(boing747).
% es_aeronave(airBusA340).
% es_aeronave(airBusA380).

%tamanio: aeronave, tamanio
es_aeronave(cessna, pequenio).
es_aeronave(beechcraft, pequenio).
es_aeronave(embraer_phenom, pequenio).
es_aeronave(boing717, mediano).
es_aeronave(embraer190, mediano).
es_aeronave(airBusA220, mediano).
es_aeronave(boing747, grande).
es_aeronave(airBusA340, grande).
es_aeronave(airBusA380, grande).

%peso_segun_tamanio: peso en toneladas, tamanio
peso_segun_tamanio(183, grande).
peso_segun_tamanio(51, mediano).
peso_segun_tamanio(4, pequenio).

%vecocidad_segun_tamanio: velocidad en km/h, tamanio
velocidad_segun_tamanio(280, pequenio).
velocidad_segun_tamanio(230, mediano).
velocidad_segun_tamanio(200, grande).

%pista_para: pista, tamnio de aeronave que la usa
pista_para(p1, pequenio).
pista_para(p2_1, mediano).
pista_para(p2_2, mediano).
pista_para(p3, grande).

direccion(p2_1, eo).
direccion(p2_2, oe).

%nivel_de_tamanio: tamanio, magnitud
nivel_de_tamanio(pequenio, 1).
nivel_de_tamanio(mediano, 2).
nivel_de_tamanio(grande, 3).

%es emergencia: situacion
es_emergencia(secuestro).
es_emergencia(error_en_motor).
es_emergencia(problema_de_salud).
es_emergencia(parto).

%atiende_emergecia: personal
atiende_emergencia(medico, parto).
atiende_emergencia(medico, problema_de_salud).
atiende_emergencia(oij, secuestro).
atiende_emergencia(mecanico, problema_en_el_motor).
atiende_emergencia(bomberos, problema_en_el_motor).
    
%orden: usar_pista: aeronave, pista
usar_pista(X,Y):-
    es_aeronave(X, Z),
    pista_para(Y,W),
    nivel_de_tamanio(Z,M), 
    nivel_de_tamanio(W,N),
    N>=M,
    not(ocupada(Y)),
    add_to_ocupada(Y), !.

%add_to_ocupada: pista
add_to_ocupada(X):-
    asserta(ocupada(X)).

%velocidad_de_aterrizaje: aeronave, velocidad
velocidad_de_aterrizaje(X,V):-
    es_aeronave(X, T),
    velocidad_segun_tamanio(V,T).

%peso_max: aeronave, peso máximo
peso_max(X,Y):-
    es_aeronave(X, W),
    peso_segun_tamanio(Y,W).

%pedir_ayuda: emergencia, llamar a
pedir_ayuda(X,Y):-
    es_emergencia(X),
    atiende_emergencia(Y,X).

%mayday: aeronave, pista asignada
mayday(X,Y):-
    es_aeronave(X,Z),
    pista_para(Y,W),
    nivel_de_tamanio(Z,M), 
    nivel_de_tamanio(W,N),
    N>=M, !.

