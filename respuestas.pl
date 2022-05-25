:-include('Hechos.pl').

miembro(O, [O | _]).
miembro(O, [_ | T]):- miembro(O, T).

tomar_input(Input_list):- read(Input), split_string(Input, " ", ",", Input_list).

identificacion(Respuesta):- 
    writeln("MayCEy: Por favor identifíquese."),
    tomar_input(Identificacion),
    es_aeronave(Aeronave, Tamanio),
    miembro(Aeronave, Identificacion),
    usar_pista(Aeronave, Pista),
    string_concat("MayCEy: Le hemos asignado la pista ", Pista, Respuesta).

% Saludar
analizarMensaje(O, 'Hola! En que le puedo ayudar?'):- saludo([S], []),  miembro(S, O).

% Atender emergencias con detalles
analizarMensaje(Oracion, R) :-
    es_emergencia(Emergencia),
    miembro(Emergencia, Oracion),
    writeln(Oracion),
    identificacion(R_pista),
    atender_emergencia(Emergencia, R_emergencia),
    string_concat(R_pista, R_emergencia, R).

% Atender emergencia sin detalles
analizarMensaje(O, 'Por favor indique su emergencia.'):- miembro("emergencia", O).
analizarMensaje(O, 'Por favor indique su emergencia.'):- miembro("mayday", O).

% Dar permiso para aterrizar
analizarMensaje(O, )

% No se identifican palabras clave
analizarMensaje(O, 'No he logrado comprender tu mensaje. Me lo podrias repetir?').

% analizarMensaje(Oracion, R) :-
%     estado(identificando),
%     es_aeronave(Aeronave, Tamanio),
%     miembro(Aeronave, Oracion),
%     usar_pista(Aeronave, Pista),
%     string_concat("Le hemos asignado la pista ", Pista, R),
%     retract(estado(identificando)).



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

