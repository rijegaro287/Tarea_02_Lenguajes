:-include('Hechos.pl').

/* Saludo
    Verifica si existe un saludo dentro de una lista de
    palabras y responde con saludo predefinido.
        Oracion: lista de palabras que forman una oración válida
        'Hola! En que le puedo ayudar?' -> respuesta prefefinida 
*/
analizarMensaje(Oracion, 'Hola! En que le puedo ayudar?'):- 
    saludo([Saludo], []),  
    miembro(Saludo, Oracion).

/* Despedida de una palabra
    Verifica si existe una despedida dentro de una lista de
    palabras y responde con una despedida predefinida.
        Oracion: lista de palabras que forman una oración válida
        'Hola! En que le puedo ayudar?' -> respuesta prefefinida 
*/
analizarMensaje(Oracion, 'Ha sido un placer atenderle. Hasta luego!'):- 
    despedida([Saludo], []),  
    miembro(Saludo, Oracion).

% Verifica si la despedida es un hasta luego
analizarMensaje(Oracion, 'Ha sido un placer atenderle. Hasta luego!'):- 
    miembro("hasta", Oracion),
    miembro("luego", Oracion).

% Verifica si la despedida es un muchas gracias
analizarMensaje(Oracion, 'Ha sido un placer atenderle. Hasta luego!'):- 
    miembro("muchas", Oracion),
    miembro("gracias", Oracion).

/* Emergencia con detalles
    Verifica si existe una emergencia en específico dentro de una lista de
    palabras y solicita la identificación de la aeronave para luego asignarle
    una pista y un equipo que atienda dicha emergencia.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: respuesta que indica en qué pista debe aterrizar y cómo se atenderá la emergencia
*/
analizarMensaje(Oracion, Respuesta):-
    pedir_ayuda(Oracion, R_emergencia),
    identificacion(ID),
    asignar_pista_emergencia(ID, R_pista),
    string_concat(R_pista, R_emergencia, Respuesta).
 
/* Emergencia sin detalles
    Verifica si alguna de las palabras "emergencia" o "mayday" están dentro de
    una lista de palabras y responde con un mensaje solicitando detalles.
    Esta regla se evalúa cuando no se detalló la emergencia desde el primer momento.
        Oracion: lista de palabras que forman una oración válida
        'Por favor indique su emergencia.' -> respuesta prefefinida 
*/
analizarMensaje(Oracion, 'Por favor indique su emergencia.'):- miembro("emergencia", Oracion).
analizarMensaje(Oracion, 'Por favor indique su emergencia.'):- miembro("mayday", Oracion).

/* Solicitud aterrizaje con detalles
    Verifica si existe una solicitud para aterrizar dentro de una lista de
    palabras e intenta asignarle una pista de aterrizaje. Esta regla se evalúa 
    correctamente cuando la aeronave se identifica desde el primer momento.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: respuesta que indica en qué pista debe aterrizar
*/
analizarMensaje(Oracion, Respuesta):-
    aterrizaje([Solicitud], []),
    miembro(Solicitud, Oracion),
    asignar_pista(Oracion, Respuesta).

/*  Solicitud aterrizaje sin detalles
    Verifica si existe una solicitud para aterrizar dentro de una lista de
    palabras y solicita que la aeronave se identifique, luego le asigna una pista. 
    Esta regla se evalúa cuando la aeronave no se identifica desde el primer momento.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: respuesta que indica en qué pista debe aterrizar
*/
analizarMensaje(Oracion, Respuesta):-
    aterrizaje([Solicitud], []),
    miembro(Solicitud, Oracion),
    identificacion(ID),
    asignar_pista(ID, Respuesta).

/* Solicitud despegue con detalles
    Verifica si existe una solicitud para despegar dentro de una lista de
    palabras e intenta asignarle una pista. Esta regla se evalúa 
    correctamente cuando la aeronave se identifica desde el primer momento.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: respuesta que indica en qué pista debe despegar
*/
analizarMensaje(Oracion, Respuesta):-
    despegue([Solicitud], []),
    miembro(Solicitud, Oracion),
    asignar_pista(Oracion, Respuesta).

/* Solicitud despegue sin detalles
    Verifica si existe una solicitud para despegar dentro de una lista de
    palabras y solicita que la aeronave se identifique, luego le asigna una pista. 
    Esta regla se evalúa cuando la aeronave no se identifica desde el primer momento.
        Oracion: lista de palabras que forman una oración válida
        Respuesta: respuesta que indica en qué pista debe despegar
*/
analizarMensaje(Oracion, Respuesta):-
    despegue([Solicitud], []),
    miembro(Solicitud, Oracion),
    identificacion(ID),
    asignar_pista(ID, Respuesta).

/* 
    Se evalúa cuando no se encontraron palabras clave en el mensaje indicado
    y solicita que repita para continuar con la conversación.
        Oracion: lista de palabras que forman una oración válida
        'No he logrado comprender tu mensaje. Me lo podrias repetir?' -> respuesta predefinida
*/
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