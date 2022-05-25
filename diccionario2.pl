%oracion(S0,S):-adverbio(S0, S1).
oracion(S0,S):-sintagma_nominal(S0,S).
oracion(S0,S):-sintagma_verbal(S1,S).
%oracion(S0,S):-sintagma_nominal(S0,S1), sintagma_verbal(S1,S).


sintagma_nominal(S0,S):-determinante(S0,S).
sintagma_nominal(S0,S):-pronombreSingular(S0,S1), sustantivo(S1,S2).
sintagma_nominal(S0,S):-sustantivo(S0,S1), preposicion(S1,S2), infinitivo(S2,S).
sintagma_nominal(S0,S):-pregunta(S0,S1).
%sintagma_nominal(S0,S):-pronombreSingular(S0, S1), sustantivo(S1,S). 
%sintagma_nominal(S0,S):-articulo(singular, S0,S1), sustantivo(S1,S).

%sintagma_verbal(S0,S):-preposicion(S0,S1).
sintagma_verbal(S0,S):- verbo(S0,S1), sintagma_nominal(S1, S2).
%sintagma_verbal(S0,S):-raiz_verbo(S0,S1), preposicion(S1,S2), sustantivo(S2, S).

determinante(S0, S):-saludo(S0, S).
%determinante(S0, S):-preposicion(S0, S).
%determinante(S0, S):-pregunta(S0, S).
determinante(S0, S):-adverbio(S0, S).
determinante(S0, S):-despedida(S0, S).

adverbio(S0,S):-afirmacion(S0,S).
adverbio(S0,S):-negacion(S0,S).
adverbio(S0,S):-lugar(S0,S).
adverbio(S0,S):-tiempo(S0,S).

% determinante: preposiciones
preposicion(['de'|S],S).
preposicion(['para'|S],S).
preposicion(['por'|S],S).
preposicion(['en'|S],S).
preposicion(['hacia'|S],S).
preposicion(['sin'|S],S).
preposicion(['sobre'|S],S).

% determinante: articulos
articulo(singular, ['el'|S],S).
articulo(singular, ['la'|S],S).
articulo(plural, ['los'|S],S).
articulo(plural, ['las'|S],S).

% determinante: pronombres
pronombreSingular(['este'|S],S).
pronombreSingular(['esta'|S],S).
pronombre(plural, ['estos'|S],S).
pronombre(plural, ['estas'|S],S).
pronombreSingular(['esto'|S],S).
pronombreSingular(['mi'|S],S).
pronombre(plural, ['mis'|S],S).
pronombreSingular(['su'|S],S).
pronombre(plural, ['sus'|S],S).
pronombreSingular(['usted'|S],S).
pronombreSingular(['yo'|S],S).
pronombreSingular(['tu'|S],S).

% determinante: conjunciones
conjuncion(['y'|S],S).
conjuncion(['o'|S],S).

% determinante: verbos
verbo(['llamo'|S],S). % llamar
verbo(['solicito'|S],S). % solicitar
verbo(['despego'|S],S). % despegar
verbo(['aterrizo'|S],S). % aterrizar
verbo(['quiero'|S],S). % querer
verbo(['queremos'|S],S). % querer
verbo(['puedo'|S],S). % poder
verbo(['podemos'|S],S). % poder
verbo(['soy'|S],S). % ser
verbo(['disminuyo'|S],S). % disminuir
verbo(['perdiendo'|S],S). % perder
verbo(['envien'|S],S). % enviar
verbo(['necesito'|S],S). % necesito
verbo(['estoy'|S],S). % estar
verbo(['entiendo'|S],S). % entender
verbo(['tengo'|S],S). % tener
verbo(['perdi'|S],S). % perder

% infinitivo
infinitivo(['llamar'|S],S). % llamar
infinitivo(['solicitar'|S],S). % solicitar
infinitivo(['despegar'|S],S). % despegar
infinitivo(['aterriar'|S],S). % aterrizar
infinitivo(['querer'|S],S). % querer
infinitivo(['poder'|S],S). % poder
infinitivo(['ser'|S],S). % ser
infinitivo(['disminuir'|S],S). % disminuir
infinitivo(['perder'|S],S). % perder
infinitivo(['enviar'|S],S). % enviar
infinitivo(['necesitar'|S],S). % necesito
infinitivo(['estar'|S],S). % estar
infinitivo(['entender'|S],S). % entender
infinitivo(['tener'|S],S). % tener


% determinante: sustantivos
sustantivo(['permiso'|S],S).
sustantivo(['equipo'|S],S).
sustantivo(['velocidad'|S],S).
sustantivo(['hora'|S],S).
sustantivo(['pista'|S],S).
sustantivo(['vuelo'|S],S).
sustantivo(['aerolinea'|S],S).
sustantivo(['matricula'|S],S).
sustantivo(['km/h'|S],S).
sustantivo(['aeronave'|S],S).
sustantivo(['minutos'|S],S).
sustantivo(['horas'|S],S).
sustantivo(['segundos'|S],S).
sustantivo(['emergencia'|S],S).
sustantivo(['mayday'|S],S).
sustantivo(['ayuda'|S],S).
sustantivo(['motor'|S],S).

% determinante: preguntas
pregunta(['quien'|S],S).
pregunta(['como'|S],S).
pregunta(['cual'|S],S).
pregunta(['donde'|S],S).
pregunta(['que'|S],S).
pregunta(['porque'|S],S).

% determinante: adverbio: lugar
lugar(['aqui'|S],S).
lugar(['alla'|S],S).
lugar(['aca'|S],S).
lugar(['ahi'|S],S).

% determinante: adverbio: tiempo
tiempo(['ya'|S],S).
tiempo(['inmediato'|S],S).
tiempo(['nunca'|S],S).
tiempo(['hoy'|S],S).
tiempo(['pronto'|S],S).

% determinante: adverbio: afirmacion
afirmacion(['ok'|S],S).
afirmacion(['si'|S],S).
afirmacion(['entendido'|S],S).
afirmacion(['bien'|S],S).
afirmacion(['correcto'|S],S).
afirmacion(['listo'|S],S).
afirmacion(['afirmativo'|S],S).

% determinante: adverbio: negacion
negacion(['no'|S],S).
negacion(['tampoco'|S],S).
negacion(['negativo'|S],S).

% saludos
saludo(["hola"|S],S).
saludo(["hola","macey"|S],S).
saludo(["buenas"|S],S).
saludo(["hey"|S],S).

% despedidas
despedida(["adios"|S],S).
despedida(["hasta","luego"|S],S).
despedida(["muchas","gracias"|S],S).

% aterrizaje
aterrizaje(["aterrizar"|S],S).
aterrizaje(["aterrizaje"|S],S).

% despegue
despegue(["despegar"|S],S).
despegue(["despegue"|S],S).