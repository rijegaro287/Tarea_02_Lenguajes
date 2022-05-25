:-include('Hechos.pl').

% Verifica si un elemento forma parte de una lista
miembro(O, [O | _]).
miembro(O, [_ | T]):- miembro(O, T).

/*
    Permite que el usuario ingrese un mensaje
    Input_list: una lisa con las palabras del mensaje ingresado
*/
tomar_input(Input_list):- read(Input), split_string(Input, " ", ",", Input_list).

/* 
    Busca una aeronave en una lista de palabras
    Identificacion: lista con palabras
    Respuesta: Mensaje que indica la pista asignada
*/
asignar_pista(Identificacion, Respuesta):-
    miembro(Aeronave, Identificacion),
    usar_pista(Aeronave, Pista),
    string_concat("MayCEy: Le hemos asignado la pista ", Pista, Respuesta).

/*
    Pide que se identifique y devuelve una pista
    Respuesta: Mensaje que indica la pista asignada
*/
identificacion(Respuesta):- 
    writeln("MayCEy: Por favor identifíquese."),
    tomar_input(Identificacion),
    es_aeronave(Aeronave, Tamanio),
    asignar_pista(Identificacion, Respuesta).

% Saludar
analizarMensaje(Oracion, 'Hola! En que le puedo ayudar?'):- 
    saludo([Saludo], []),  
    miembro(Saludo, Oracion).

% Atender emergencias con detalles
analizarMensaje(Oracion, Respuesta):-
    es_emergencia(Emergencia),
    miembro(Emergencia, Oracion),
    writeln(Oracion),
    identificacion(R_pista),
    atender_emergencia(Emergencia, R_emergencia),
    string_concat(R_pista, R_emergencia, Respuesta).

% Atender emergencia sin detalles
analizarMensaje(Oracion, 'Por favor indique su emergencia.'):- miembro("emergencia", Oracion).
analizarMensaje(Oracion, 'Por favor indique su emergencia.'):- miembro("mayday", Oracion).

% Solicitar aterrizaje con detalles
analizarMensaje(Oracion, Respuesta):-
    aterrizaje([Solicitud], []),
    miembro(Solicitud, Oracion),
    asignar_pista(Oracion, Respuesta).

% Solicitar aterrizaje sin detalles
analizarMensaje(Oracion, Respuesta):-
    aterrizaje([Solicitud], []),
    miembro(Solicitud, Oracion),
    identificacion(Respuesta).

% No se identifican palabras clave
analizarMensaje(Oracion, 'No he logrado comprender tu mensaje. Me lo podrias repetir?').

% % solicito permiso para despegar
% % % Por favor indique el numero de vuelo.
% analizarMensaje('solicito permiso para despegar', 'Por favor indique el numero de vuelo.').

% % Matricula.
% % % Por favor indique el tipo de aeronave.
% analizarMensaje(_, 'Por favor indique el tipo de aeronave.').

% % Aeronave.
% % % Por favor indique la hora de salida. 
% analizarMensaje(_, 'Por favor indique la hora de salida.').

% % Hora de salida.
% % % Por favor indique la dirección de salida. 
% analizarMensaje(_, 'Por favor indique la dirección de salida.').

% % Dirección.
% % % Se asignó _ por 5 minutos.
% analizarMensaje(_, 'Se asignó _ por 5 minutos.').

% % Gracias.
% % % Con gusto. 
% analizarMensaje('gracias', 'Con gusto.').

% % solicito permiso para aterrizar.
% % % Por favor indique su matricula. 
% analizarMensaje(_, 'Por favor indique su matricula.').

% % Matricula.
% % % Por favor indique el tipo de aeronave. 
% analizarMensaje(_, 'Por favor indique el tipo de aeronave.').

% % Aeronave. 
% % % Por favor indique su velocidad. 
% analizarMensaje(_, 'Por favor indique su velocidad.').

% % Velocidad. 
% % % Por favor indique su distancia a la pista. 
% analizarMensaje(_, 'Por favor indique su distancia a la pista. ').

% % Distancia. 
% % % Por favor indique su dirección. 
% analizarMensaje(_, 'Por favor indique su dirección. ').

% % Dirección.
% % Se asignó _ por 5 minutos.

% % bleep bloop
% % % No he logrado comprender tu mensaje. Me lo podrias repetir?
% analizarMensaje(_, 'No he logrado comprender tu mensaje. Me lo podrias repetir?').

