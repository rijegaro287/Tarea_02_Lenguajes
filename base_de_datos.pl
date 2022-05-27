:-include('bnf.pl').

:- dynamic(ocupada/1).
ocupada().

%tamanio: aeronave, tamanio
es_aeronave("cessna", pequenio).
es_aeronave("beechcraft", pequenio).
es_aeronave("embraer_phenom", pequenio).
es_aeronave("boing717", mediano).
es_aeronave("embraer190", mediano).
es_aeronave("airBusA220", mediano).
es_aeronave("boing747", grande).
es_aeronave("airBusA340", grande).
es_aeronave("airBusA380", grande).

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

direccion(p2_1, "eo").
direccion(p2_2, "oe").

%nivel_de_tamanio: tamanio, magnitud
nivel_de_tamanio(pequenio, 1).
nivel_de_tamanio(mediano, 2).
nivel_de_tamanio(grande, 3).

%es emergencia: situacion
es_emergencia("secuestro").
es_emergencia("parto").
es_emergencia("asesinato").

%atiende_emergecia: emergencia, respuesta
atender_emergencia("secuestro", ". Llamaremos al OIJ.").
atender_emergencia("parto", ". Llamaremos a un médico.").
atender_emergencia("asesinato", ". Llamaremos a un médico.").
atender_emergencia("paro cardiaco", ". Llamaremos a un médico.").
atender_emergencia("problema motores", ". Tendremos un equipo de bomberos.").

/* 
    Verifica si un elemento forma parte de una lista
        Elemento: elemento a que se desea buscar 
        []: lista que se va a verificar
*/
miembro(Elemento, [Elemento | _]).
miembro(Elemento, [_ | T]):- miembro(Elemento, T).

/*
    Permite que el usuario ingrese un mensaje
        Input_list: una lisa con las palabras del mensaje ingresado
*/
tomar_input(Input_list):- 
    read(Input),
    split_string(Input, " ", ",", Input_list).

/*
    Pide que se indique la dirección de aterrizaje o despegue
        Direccion: una lista con la direccion dada por el usuario
*/
preguntar_direccion(Direccion):- 
    writeln("MayCEy: Por favor indique su direccion. (para Este-Oeste, escriba eo; para Oeste-Este, escriba oe)"),
    tomar_input(Direccion).

/*
    Pide que se identifique
        ID: una lista con la identificación dada por el usuario
*/
identificacion(ID):- 
    writeln("MayCEy: Por favor identifique su tipo de avion."),
    tomar_input(ID).

/* 
    Pregunta la dirección de la aeronave
    y le asigna una pista adecuada.
        Pista: pista donde deberá aterrizar
*/
identificar_direccion(Pista):-
    preguntar_direccion(Oracion_direccion),
    direccion(Pista, Direccion),
    miembro(Direccion, Oracion_direccion).

%add_to_ocupada: pista
add_to_ocupada(X):-
    asserta(ocupada(X)).
    
/* 
    Pide una pista disponible para un avion mediano
    y solicita la dirección de vuelo.
        Avion: tipo de aeronave
        Pista: pista que se le asigna
*/
pedir_pista(Avion,Pista):-
    es_aeronave(Avion, mediano),
    identificar_direccion(Pista),
    not(ocupada(Pista)),
    add_to_ocupada(Pista).
    
/*
    Pide una pista disponible para cualquier tipo de avion.
        Avion: tipo de aeronave
        Pista: pista que se le asigna
*/
pedir_pista(Avion,Pista):-
    es_aeronave(Avion, TamanioAvion),
    pista_para(Pista,TamanioPista),
    nivel_de_tamanio(TamanioAvion,M), 
    nivel_de_tamanio(TamanioPista,N),
    N>=M,
    not(ocupada(Pista)),
    add_to_ocupada(Pista), !.

/*
    Busca una aeronave en una lista de palabras y le asigna una pista
        Identificacion: lista con palabras
        Respuesta: Mensaje que indica la pista asignada
*/
asignar_pista(Identificacion, Respuesta):-
    es_aeronave(Aeronave, Tamanio),
    miembro(Aeronave, Identificacion),
    pedir_pista(Aeronave, Pista),
    string_concat("Le hemos asignado durante 5 minutos la pista ", Pista, Respuesta).

/* 
    Pide una pista para un avion mediano sin
    importar si está disponible
    y solicita la dirección de vuelo.
        Avion: tipo de aeronave
        Pista: pista que se le asigna
*/
mayday(Avion,Pista):-
    es_aeronave(Avion, mediano),
    identificar_direccion(Pista).

%mayday: aeronave, pista asignada
mayday(Avion,Pista):-
    es_aeronave(Avion,TamanioAvion),
    pista_para(Pista,TamanioPista),
    nivel_de_tamanio(TamanioAvion,M), 
    nivel_de_tamanio(TamanioPista,N),
    N>=M, !.

/*
    Busca una aeronave en una lista de palabras y le asigna una pista
    sin importar si está ocupada.
        Identificacion: lista con palabras
        Respuesta: Mensaje que indica la pista asignada
*/
asignar_pista_emergencia(Identificacion, Respuesta):-
    es_aeronave(Aeronave, Tamanio),
    miembro(Aeronave, Identificacion),
    mayday(Aeronave, Pista),
    string_concat("Aterrice lo mas pronto posible. Le hemos asignado la pista ", Pista, Respuesta).

/*  Emergencias de una palabra.
    Recorre una lista de palabras buscando una emergencia.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: indica cómo se manejará la emergencia
*/
pedir_ayuda(Oracion, Respuesta):-
    es_emergencia(Emergencia),
    miembro(Emergencia, Oracion),
    atender_emergencia(Emergencia, Respuesta).

% Verifica si la emergencia es un paro cardiaco
pedir_ayuda(Oracion, Respuesta):-
    miembro("paro", Oracion),
    miembro("cardiaco", Oracion),
    atender_emergencia("paro cardiaco", Respuesta).

% Verifica si la emergencia es un problema en los motores
pedir_ayuda(Oracion, Respuesta):-
    miembro("problema", Oracion),
    miembro("motores", Oracion),
    atender_emergencia("problema motores", Respuesta).

%velocidad_de_aterrizaje: aeronave, velocidad
velocidad_de_aterrizaje(Avion,Velocidad):-
    es_aeronave(Avion, Tamanio),
    velocidad_segun_tamanio(Velocidad,Tamanio).

%peso_max: aeronave, peso máximo
peso_max(Avion,Peso):-
    es_aeronave(Avion, Tamanio),
    peso_segun_tamanio(Peso,Tamanio).