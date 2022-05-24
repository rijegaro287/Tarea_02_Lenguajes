:-include('diccionario2.pl').

analizarMensaje(O, 'Hola! En que le puedo ayudar?'):- saludo([X], []),  miembro(X, O), !.


analizarMensaje(O, 'No he logrado comprender tu mensaje. Me lo podrias repetir?').

miembro(O, [O | _]).
miembro(O, [_ | T]):- miembro(O, T).

% % solicito permiso para despegar
% % % Por favor indique el numero de vuelo.
% analizarMensaje('solicito permiso para despegar', 'Por favor indique el numero de vuelo.').

% % Numero de vuelo
% % % Por favor indique la aerolinea.
% analizarMensaje('', 'Por favor indique la aerolinea.').

% % Aerolinea 
% % % Por favor indique la matricula.
% analizarMensaje(_, 'Por favor indique la matricula.').

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

% % mayday. 
% % Por favor indique su emergencia.
% analizarMensaje('mayday', 'Por favor indique su emergencia.').

% % emergencia. 
% % % Por favor identifiquese. 
% analizarMensaje(_, 'Por favor identifiquese.').

% % identificación. 
% % % Se asignó _ y se envió equipo de ayuda. 
% analizarMensaje(_, 'Se asignó _ y se envió equipo de ayuda.').


% % bleep bloop
% % % No he logrado comprender tu mensaje. Me lo podrias repetir?
% analizarMensaje(_, 'No he logrado comprender tu mensaje. Me lo podrias repetir?').

